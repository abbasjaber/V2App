import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class Detcard extends StatelessWidget {
  final String? text;
  final String? image;
  final String? chiptitle;
  final Color? color;
  final Color? textcolor;
  final String? icon;
  const Detcard({
    super.key,
    this.text,
    required this.image,
    required this.chiptitle,
    required this.color,
    required this.icon,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  image!,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text!,
                    maxLines: null,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              context.go('/event-details');
            },
            child: Chip(
              label: Text(
                chiptitle!,
                style: TextStyle(
                  color: textcolor ?? Colors.white,
                ),
              ),
              backgroundColor: Colors.blue,
              avatar: Image.network(icon!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
