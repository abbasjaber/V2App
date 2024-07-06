import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  final String? bannerimage;
  final String? title;
  final String? deatials;
  final String? circleAvatar;
  const EventDetails({
    super.key,
    this.bannerimage,
    this.title,
    this.deatials,
    this.circleAvatar,
  });

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            widget.bannerimage!,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(widget.title!),
        const SizedBox(
          height: 30,
        ),
        Text(
          widget.deatials!,
          maxLines: null,
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => CircleAvatar(
              backgroundImage: NetworkImage(widget.circleAvatar!),
              radius: 30,
            ),
          ),
        ),
      ],
    );
  }
}
