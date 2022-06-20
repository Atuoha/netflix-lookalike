import 'package:flutter/material.dart';

import '../models/models.dart';

class SinglePreview extends StatelessWidget {
  final Content content;
  const SinglePreview({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 30),
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(content.imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: content.color!,
              width: 5,
            ),
          ),
        ),
        Container(
          height: 120,
          width: 120,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black87,
                Colors.black45,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            shape: BoxShape.circle,
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            height: 60,
            child: Image.asset(
              content.titleImageUrl!,
              width: 120,
            ),
          ),
        )
      ],
    );
  }
}
