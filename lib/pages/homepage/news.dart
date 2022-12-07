import 'package:app_spotify/pages/homepage/util/play_list.dart';
import 'package:app_spotify/pages/homepage/util/song_screen.dart';
import 'package:app_spotify/services/remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../models/post.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {

  List<Post> postData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RemoteService.fetchPost().then((dataFromServer) {
      setState(() {
        postData = dataFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 393,
              height: 290,
              color: Colors.black87,
              child: SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: postData.length,
                    itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SongScreen()));
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.27,
                                margin: EdgeInsets.only( left: 22, right: 10),
                                width: MediaQuery.of(context).size.width * 0.40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: NetworkImage('${postData[index].image}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                margin: EdgeInsets.only( left: 130, top: 190),
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.grey,
                                ),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white70,
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 150,
                                margin: EdgeInsets.only( left: 25, top: 225),
                                child: Text(
                                  '${postData[index].name}',
                                  style: TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 150,
                                margin: EdgeInsets.only( left: 25, top: 252),
                                child: Text(
                                  '${postData[index].singer}',
                                  style: TextStyle(fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                    },
                ),
              ),
            ),
            Container(
              width: 393,
              height: 50,
              color: Colors.black87,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                        'Playlist',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 205),
                    child: Text(
                      'See More',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 210,
              width: 393,
              color: Colors.black87,
              child: ListView.builder(
                itemCount: postData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PlayList()));
                    },
                    child: Card(
                      color: Colors.green[400],
                      margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.play_arrow_rounded, size: 30, color: Colors.white70,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only( left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 170,
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text('${postData[index].name}',
                                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                                  ),
                                  Container(
                                    child: Text('${postData[index].singer}',
                                      style: TextStyle(fontSize: 16, color: Colors.white),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              margin: EdgeInsets.only(top: 2, left: 45),
                              child: Icon(Icons.favorite, color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


