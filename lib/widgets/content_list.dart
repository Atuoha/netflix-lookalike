import 'package:flutter/material.dart';
import '../models/models.dart';
import 'widgets.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginal;
  const ContentList({
    Key? key,
    required this.title,
    required this.contentList,
     this.isOriginal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 17),
          height: isOriginal ? 550 : 220,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (context, index) => SingleContentList(
              contentHeight: isOriginal ? 400 : 200,
              contentWidth: isOriginal ? 200 : 130,
              content: contentList[index],
            ),
          ),
        )
      ],
    );
    ;
  }
}
