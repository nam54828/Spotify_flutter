import 'package:app_spotify/home.dart';
import 'package:app_spotify/screen/sign_in.dart';
import 'package:app_spotify/tabbars/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 36, left: 24),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
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
                            color: Color.fromRGBO(230, 230, 230, 1)),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 27),
                  child: Column(
                    children: [
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
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                          color:
                                              Color.fromRGBO(216, 212, 212, 1),
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
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        width: 345,
                        height: 360,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 25),
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(6, 1, 180, 0.05),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, right: 70),
                                      child: Text(
                                        "My Account ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontFamily: 'Satoshi-bold',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Make changes to your account",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          color:
                                              Color.fromRGBO(171, 171, 171, 1),
                                          fontFamily: 'Satoshi-Regular',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 90, top: 23),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 25),
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(6, 1, 180, 0.05),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, right: 20),
                                      child: Text(
                                        "Saved Beneficiary ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontFamily: 'Satoshi-bold',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Manage your saved account",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          color:
                                              Color.fromRGBO(171, 171, 171, 1),
                                          fontFamily: 'Satoshi-Regular',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 104, top: 23),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 25),
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(6, 1, 180, 0.05),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, right: 20),
                                      child: Text(
                                        "Face ID / Touch ID ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontFamily: 'Satoshi-bold',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Manage your device security",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          color:
                                              Color.fromRGBO(171, 171, 171, 1),
                                          fontFamily: 'Satoshi-Regular',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 25),
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    Icons.verified_user_outlined,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(6, 1, 180, 0.05),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, right: 20),
                                      child: Text(
                                        "Two-Factor Authentication ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontFamily: 'Satoshi-bold',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Further secure your account for safety",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          color:
                                              Color.fromRGBO(171, 171, 171, 1),
                                          fontFamily: 'Satoshi-Regular',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 53, top: 23),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 25),
                                  height: 40,
                                  width: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      FirebaseAuth.instance // lấy dữ liệu người dùng đã đăng nhập
                                          .signOut()
                                          .then((value) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    signIn()));
                                      });
                                    },
                                    child: Icon(
                                      Icons.logout_outlined,
                                      color: Color.fromRGBO(6, 1, 180, 0.4),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(6, 1, 180, 0.05),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, right: 130),
                                      child: Text(
                                        "Log out ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontFamily: 'Satoshi-bold',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Further secure your account for safety",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          color:
                                              Color.fromRGBO(171, 171, 171, 1),
                                          fontFamily: 'Satoshi-Regular',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 54, top: 23),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(80, 79, 79, 1),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        "More",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Satoshi-Bold',
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        width: 335,
                        height: 140,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 20),
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    Icons.notifications_outlined,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(6, 1, 180, 0.05),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 20),
                                  child: Text(
                                    "Help & Support ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontFamily: 'Satoshi-bold',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 136, top: 23),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 20),
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    Icons.error_outline,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(6, 1, 180, 0.05),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 20),
                                  child: Text(
                                    "About App ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontFamily: 'Satoshi-bold',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 163, top: 23),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Color.fromRGBO(6, 1, 180, 0.4),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(80, 79, 79, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
