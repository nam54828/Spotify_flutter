import 'package:flutter/material.dart';

class Artists extends StatefulWidget {
  const Artists({Key? key}) : super(key: key);

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('artists'),),
      body: Center(
        child: Text('artists', style: TextStyle(fontSize: 40),),
      ),
    );
  }
}
