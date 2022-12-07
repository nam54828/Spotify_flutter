import 'package:app_spotify/screen/choose_mode.dart';
import 'package:flutter/material.dart';

class getStarted extends StatefulWidget {
  const getStarted({Key? key}) : super(key: key);

  @override
  State<getStarted> createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/girl.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 35),
              child: Image.asset(
                'images/logo.png',
                width: 400,
                height: 59,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 380),
              child: Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Color.fromRGBO(218, 218, 218, 1),
                    fontFamily: 'Satoshi_Bold',
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 21),
              child: Text(
                "Lorem ipsum dolor sit amet, \n"
                    " consectetur adipiscing elit. Sagittis enim \n"
                    " purus sed phasellus. Cursus ornare id \n"
                    "scelerisque aliquam.",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(121, 121, 121, 1),
                  fontFamily: 'Satoshi_Regular',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 37,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  color: Color.fromRGBO(66, 200, 60, 1),
                  height: 92,
                  minWidth: 330,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => chooseMode() )),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(246, 246, 246, 1),
                      fontFamily: 'Satoshi_Bold',
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
