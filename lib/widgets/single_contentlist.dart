import 'package:flutter/material.dart';
import '../models/models.dart';

class SingleContentList extends StatelessWidget {
  final Content content;
  final double contentHeight;
  final double contentWidth;
  const SingleContentList(
      {Key? key,
      required this.content,
      required this.contentHeight,
      required this.contentWidth,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: contentHeight,
      width: contentWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(content.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
