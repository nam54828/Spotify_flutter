import 'package:app_spotify/pages/homepage/artists.dart';
import 'package:app_spotify/pages/homepage/news.dart';
import 'package:app_spotify/pages/homepage/podcast.dart';
import 'package:app_spotify/pages/homepage/video.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
  with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
  tabController = TabController(length: 4, vsync: this);
  super.initState();
  }

  @override
  void dispose() {
  tabController.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 36,
            ),
            onPressed: (){

            },
          ),
        ),
        title: Center(
          child: Image.asset(
            'images/logo.png',
            width: 120.0,
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 36,
              ),
              onPressed: (){},
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(children: [
            Container(
              width: 392.5,
              height: 205,
              color: Colors.black87,
              child: Center(
                child: Image.asset(
                  'images/anh1.png',
                  width: 360.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],),
          SingleChildScrollView(
            child: Container(
              height: 441,
              width: double.infinity,
              color: Colors.black87,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: TabBar(
                              unselectedLabelColor: Colors.white54,
                              labelColor: Colors.white,
                              indicatorColor: Color(00000000),
                              controller: tabController,
                              tabs: [
                                Row(children: [Text("News", style: TextStyle(fontSize: 25),),],),
                                Row(children: [SizedBox(width: 15), Text("Video", style: TextStyle(fontSize: 25),),],),
                                Row(children: [SizedBox(width: 15), Text("Artists", style: TextStyle(fontSize: 25),),],),
                                Row(children: [SizedBox(width: 15), Text("Podcast", style: TextStyle(fontSize: 25),),],),
                              ],
                              isScrollable: true,
                            ),
                          ),
                          SizedBox(height: 20),

                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          News(),
                          Video(),
                          Artists(),
                          Podcast(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
