import 'package:flutter/material.dart';
import '../models/models.dart';
import 'widgets.dart';

class Previews extends StatelessWidget {
  final List<Content> previews;
  final String title;
  const Previews({
    Key? key,
    required this.previews,
    required this.title,
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
          height: 130,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: previews.length,
            itemBuilder: (context, index) => SinglePreview(
              content: previews[index],
            ),
          ),
        )
      ],
    );
  }
}
