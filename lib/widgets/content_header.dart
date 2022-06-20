import 'package:flutter/material.dart';
import '../models/content_model.dart';
import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 510,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 510,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Image.asset(
                featuredContent.titleImageUrl!,
                width: 180,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  VerticalIconButton(
                    icon: Icons.add,
                    title: 'List',
                  ),
                  PlayButton(),
                  VerticalIconButton(
                    icon: Icons.info_outline,
                    title: 'Info',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
