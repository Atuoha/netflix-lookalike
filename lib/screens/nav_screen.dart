import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/cubits/cubits.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import '../widgets/widgets.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = const [
    HomeScreen(key: PageStorageKey('home')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _items = {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Download': Icons.file_download,
    'More': Icons.menu,
  };

  int _currentIndex = 0;
  void changeScreenIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppbarCubit>(
        create: (context) => AppbarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context) ? BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        onTap: changeScreenIndex,
        items: _items
            .map(
              (title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                  icon: Icon(icon),
                  label: title,
                ),
              ),
            )
            .values
            .toList(),
      ): null,
    );
  }
}
