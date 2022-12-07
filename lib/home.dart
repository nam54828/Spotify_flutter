import 'package:app_spotify/icons/app_icons_icons.dart';
import 'package:app_spotify/tabbars/discovery.dart';
import 'package:app_spotify/tabbars/heart.dart';
import 'package:app_spotify/tabbars/homepage.dart';
import 'package:app_spotify/tabbars/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final tabBar = [
    HomePage(),
    Discovery(),
    Heart(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabBar[_selectedIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          selectedItemColor: Color.fromRGBO(66, 200, 60, 1),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Color.fromRGBO(115, 115, 115, 1),
          showSelectedLabels: false,
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(AppIcons.home),
              label: "Explore",
              backgroundColor: Colors.grey
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.discovery),
              label: "Explore",
                backgroundColor: Colors.grey
            ),
            BottomNavigationBarItem(
                icon: Icon(AppIcons.heart),
              label: "Explore",
                backgroundColor: Colors.grey
            ),
            BottomNavigationBarItem(
                icon: Icon(AppIcons.profile),
              label: "Explore",
                backgroundColor: Colors.grey
            ),
          ],
        ),
      ),
    );
  }
}
