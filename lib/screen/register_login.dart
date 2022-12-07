import 'package:app_spotify/screen/choose_mode.dart';
import 'package:app_spotify/screen/register.dart';
import 'package:app_spotify/screen/sign_in.dart';
import 'package:flutter/material.dart';

class registerLogin extends StatefulWidget {
  const registerLogin({Key? key}) : super(key: key);

  @override
  State<registerLogin> createState() => _registerLoginState();
}

class _registerLoginState extends State<registerLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(28, 27, 27, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, left: 34),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => chooseMode()));
                },
                icon: Icon(Icons.chevron_left),
                color: Color.fromRGBO(221, 221, 221, 1),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.03),
                  borderRadius: BorderRadius.circular(50)),
            ),
            Container(
              margin: EdgeInsets.only(top: 175),
              child: Center(
                child: Image.asset('images/logo.png'),
              ),
            ),
            Container(
              child: Container(
                margin: EdgeInsets.only(left: 250),
                child: Image.asset('images/union1.png'),
              ),
            ),
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 380),
                child: Image.asset('images/anh_register_login.png'),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 301),
                  child: Center(
                    child: Text(
                      "Enjoy Listening To Music",
                      style: TextStyle(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        fontFamily: 'Satoshi_Bold',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 21),
                  child: Center(
                    child: Text(
                      "Spotify is a proprietary Swedish audio \n streaming and media services provider ",
                      style: TextStyle(
                        color: Color.fromRGBO(160, 160, 160, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        fontFamily: 'Satoshi_Regular',
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, top: 30),
                      child: Column(
                        children: [
                          MaterialButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => register())),
                            height: 73,
                            minWidth: 155,
                            color: Color.fromRGBO(66, 200, 60, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Satoshi_Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 88, top: 30),
                      child: Column(
                        children: [
                          MaterialButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signIn())),
                            height: 73,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Satoshi_Bold',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 510, left: 250),
                child: Image.asset('images/union2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
