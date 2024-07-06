import 'package:flutter/material.dart';
import 'package:v2/core/feature/color.dart';

class CategoryCardWidget extends StatelessWidget {
  final Color? color;
  final String? text;
  final String? icon;
  const CategoryCardWidget({super.key, this.color, this.text, this.icon});

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
              color: color ?? primaryColor.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: icon != null ? Image.network(icon!) : Container(),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text!),
      ],
    );
  }
}
