import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final Color color;
  final String text;
  final Icon icon;
  const CategoryCardWidget(
      {super.key, required this.color, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: color,
              width: 2,
            ),
          ),
          child: icon,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text),
      ],
    );
  }
}
