import 'package:flutter/material.dart';

class Podcast extends StatefulWidget {
  const Podcast({Key? key}) : super(key: key);

  @override
  State<Podcast> createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('podcast'),),
      body: Center(
        child: Text('podcast', style: TextStyle(fontSize: 40),),
      ),
    );
  }
}
