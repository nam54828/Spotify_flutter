import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayList extends StatefulWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {

  bool isPlaying = false;
  double value = 0;

  final player = AudioPlayer();

  Duration? duration = Duration(seconds: 0);

  void initPlayer() async {
    await player.setSource(AssetSource("MaryOnACross.mp3"));
    duration = await player.getDuration();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bai2.jpg'),
                  fit: BoxFit.cover,
                )
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                color: Colors.black54,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset('assets/bai2.jpg',width: 350,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Mary On A Cross',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  letterSpacing: 6,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Ghost',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 6,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${(value / 60).floor()} : ${(value % 60).floor()}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Slider.adaptive(
                    min: 0,
                    max: duration!.inSeconds.toDouble(),
                    value: value, onChanged: (value){},
                    activeColor: Colors.white,
                  ),
                  Text(
                    "${duration!.inMinutes} : ${duration!.inSeconds % 60}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  color: Colors.black87,
                  border: Border.all(color: Colors.lightGreen),
                ),
                child: InkWell(
                  onTap: () async {
                    if (isPlaying) {
                      await player.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    }else{
                      await player.resume();
                      setState(() {
                        isPlaying = true;
                      });
                      player.onPositionChanged.listen(
                              (position) {
                            setState(() {
                              value = position.inSeconds.toDouble();
                            });
                          }
                      );
                    }
                  },
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
