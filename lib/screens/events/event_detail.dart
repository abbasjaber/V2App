import 'package:flutter/material.dart';
import 'package:v2/remote/models/event_model.dart';
import 'package:v2/widgets/gradient_button.dart';

class EventDetails extends StatefulWidget {
  final Event? ev;

  const EventDetails({
    super.key,
    this.ev,
  });

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.ev!.imageUrl!,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.ev!.title!),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.ev!.description!,
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
                      backgroundImage: NetworkImage(
                          "https://www.w3schools.com/w3images/avatar${(index % 4) + 1}.png"),
                      radius: 30,
                    ),
                  ),
                ),
 
                const SizedBox(
                  height: 20,
                ),
                const GradientButton(
                  title: "Volunte Now!",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
