import 'package:app_spotify/icons/app_icons_icons.dart';
import 'package:app_spotify/screen/register_login.dart';
import 'package:flutter/material.dart';

class chooseMode extends StatefulWidget {
  const chooseMode({Key? key}) : super(key: key);

  @override
  State<chooseMode> createState() => _chooseModeState();
}

class _chooseModeState extends State<chooseMode> {
  ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
  );
  ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
  bool _iconBool = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ?_darkTheme : _lightTheme,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('images/girl_choose_mode.png'),
                fit: BoxFit.cover
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 39),
                child: Image.asset("images/logo.png",
                  width: 400,
                  height: 59,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 320),
                child: Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color.fromRGBO(218, 218, 218, 1),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Satoshi_Bold',
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 73,
                        height: 73,
                        margin: EdgeInsets.only(left: 84),
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              _iconBool = !_iconBool;
                            });
                          },
                          icon: Icon(AppIcons.moon, color: Colors.white,),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.1),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 73,
                        height: 73,
                        margin: EdgeInsets.only(left: 71),
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              _iconBool = !_iconBool;
                            });
                          },
                          icon: Icon(Icons.sunny, color: Colors.white,),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.1),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 78),
                        child: Text(
                          "Dark Mode",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Satoshi-Bold",
                              color: Color.fromRGBO(218, 218, 218, 1)
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 55),
                        child: Text(
                          "Light Mode",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Satoshi-Bold",
                              color: Color.fromRGBO(218, 218, 218, 1)
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 68,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    color: Color.fromRGBO(66, 200, 60, 1),
                    height: 92,
                    minWidth:330,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => registerLogin() )),
                    child: Text(
                      "Continue",
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
      ),
    );
  }
}
