import 'package:flutter/material.dart';
import 'package:netflix_clone/assets.dart';
import 'widgets.dart';

const style = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 16.0,
);

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(
        (scrollOffset / 350).clamp(0, 1).toDouble(),
      ),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
        tablet: _CustomAppBarMobile(),
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              Assets.netflixLogo1,
              width: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Home',
                      style: style,
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Tv Shows',
                      style: style,
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Movies',
                      style: style,
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Latest',
                      style: style,
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'My List',
                      style: style,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: null,
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'KIDS',
                      style: style,
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'DVD',
                      style: style,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.card_giftcard,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: null,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              Assets.netflixLogo0,
              width: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Tv Shows',
                      style: style,
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Movies',
                      style: style,
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'My List',
                      style: style,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
