import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _HomePageState();
}

class _HomePageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Map')),
    );
  }
}
