import 'package:app_spotify/home.dart';
import 'package:app_spotify/models/post.dart';
import 'package:app_spotify/pages/homepage/util/play_list.dart';
import 'package:app_spotify/screen/register.dart';
import 'package:app_spotify/services/remote.dart';
import 'package:app_spotify/tabbars/homepage.dart';
import 'package:app_spotify/tabbars/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {

  List<Post> postData = [];

  @override
  void initState() {
    super.initState();
    RemoteService.fetchPost().then((dataFromServer) {
      setState(() {
        postData = dataFromServer;
      });
    });
  }

  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: 318,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60)),
                      color: Color.fromRGBO(44, 43, 43, 1),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 36, left: 24),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                },
                                icon: Icon(Icons.chevron_left),
                                color: Color.fromRGBO(221, 221, 221, 1),
                              ),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.03),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 105, top: 35),
                              child: Text(
                                "Proflie",
                                style: TextStyle(
                                  fontFamily: 'Satoshi-Bold',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  color: Color.fromRGBO(230, 230, 230, 1)
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 35, left: 110),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                                icon: Icon(Icons.more_vert),
                                color: Color.fromRGBO(221, 221, 221, 1),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Center(
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: Color.fromRGBO(9, 139, 220, 1.0),
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage('images/girl.png'),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("user")
                                  .where("uid",
                                      isEqualTo: currentUser.currentUser!.uid)
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      var data = snapshot.data!.docs[i];
                                      return Center(
                                        child: Text(
                                          data['email'],
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  216, 212, 212, 1),
                                              fontFamily: 'Satoshi-Regular',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                        ),
                        Container(
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("user")
                                .where("uid",
                                    isEqualTo: currentUser.currentUser!.uid)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    var data = snapshot.data!.docs[i];
                                    return Center(
                                      child: Text(
                                        data['fullname'],
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Satoshi-Bold',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 100),
                              child: Column(
                                children: [
                                  Text("778", style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    fontFamily: 'Satoshi-Bold',
                                      color: Color.fromRGBO(255, 255, 255, 1)
                                  ),)
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 123),
                              child: Column(
                                children: [
                                  Text("243", style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      fontFamily: 'Satoshi-Bold',
                                    color: Color.fromRGBO(255, 255, 255, 1)
                                  ),)
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 89),
                              child: Column(
                                children: [
                                  Text("Followes", style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      fontFamily: 'Satoshi-Regular',
                                      color: Color.fromRGBO(161, 161, 161, 1)
                                  ),)
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 104),
                              child: Column(
                                children: [
                                  Text("Followes", style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      fontFamily: 'Satoshi-Regular',
                                      color: Color.fromRGBO(161, 161, 161, 1)
                                  ),)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 228),
                    child: Text(
                      "PUBLIC PLAYLISTS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Satoshi-Bold'),
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
                            color: Colors.black,
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
          ],
        ),
      ),
    );
  }
}
