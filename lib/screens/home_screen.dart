import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../cubits/cubits.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  // double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        // setState(() {
        //   _scrollOffset = _scrollController.offset;
        // });
        BlocProvider.of<AppbarCubit>(context)
            .setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        onPressed: null,
        child: const Icon(
          Icons.cast,
          color: Colors.white,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppbarCubit, double>(
          builder: (context, scrollOffset) {
            return CustomAppBar(
              scrollOffset: scrollOffset,
            );
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: ContentHeader(
              featuredContent: sintelContent,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 5),
            sliver: SliverToBoxAdapter(
              key: PageStorageKey('previews'),
              child: Previews(
                title: 'Previews',
                previews: previews,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 15),
            sliver: SliverToBoxAdapter(
              key: PageStorageKey('playlist'),
              child: ContentList(
                title: 'My Playlists',
                contentList: myList,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 15),
            sliver: SliverToBoxAdapter(
              key: PageStorageKey('originals'),
              child: ContentList(
                  title: 'Netflix Originals',
                  contentList: originals,
                  isOriginal: true),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: 15,
              bottom: 20,
            ),
            sliver: SliverToBoxAdapter(
              key: PageStorageKey('trending'),
              child: ContentList(
                title: 'Trending',
                contentList: trending,
              ),
            ),
          )
        ],
      ),
    );
  }
}
