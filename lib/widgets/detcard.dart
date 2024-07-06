import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v2/remote/models/event_model.dart';

// ignore: must_be_immutable
class Detcard extends StatelessWidget {
  final Event? ev;
  const Detcard({
    super.key,
    this.ev,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  ev!.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    ev!.title!,
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
              Map<String, dynamic> data = <String, dynamic>{};
              data['event'] = ev;
              context.push('/event-details', extra: data);
            },
            child: Chip(
              label: Text(
                ev!.category!,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              backgroundColor: Colors.red,
              avatar: Image.network(ev!.imageUrl!),
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
