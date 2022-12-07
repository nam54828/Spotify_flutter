
import 'package:app_spotify/home.dart';
import 'package:app_spotify/reusable_widgets/reusable_widget.dart';
import 'package:app_spotify/screen/register.dart';
import 'package:app_spotify/screen/register_login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void showFaileMessage() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Login"),
              content: Text("Login failed"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, "OK");
                    },
                    child: Text("OK"))
              ],
            ));
  }
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
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
                              builder: (context) => registerLogin()));
                    },
                    icon: Icon(Icons.chevron_left),
                    color: Color.fromRGBO(221, 221, 221, 1),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.03),
                      borderRadius: BorderRadius.circular(50)
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 36, left: 70),
                      child: Image.asset(
                        'images/logo.png',
                        height: 33,
                        width: 108,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 22, left: 102),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "If You Need Any Support",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(225, 225, 225, 1)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Click Here",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(56, 180, 50, 1)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 38,
            ),
            Padding(
              padding: EdgeInsets.only(top: 29),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 29, top: 18),
                      width: 334,
                      height: 80,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter Username Or Email",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(167, 167, 167, 0.6)),
                            ),
                            style: TextStyle(
                                color: Colors.white
                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Vui lòng nhập Email");
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-z0-9A-Z.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Vui lòng nhập Email hợp lệ");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              emailController.text = value!;
                            },
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                              width: 1),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 29, top: 18),
                      width: 334,
                      height: 80,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(167, 167, 167, 0.6)),
                              suffixIcon: GestureDetector(
                                onTap:(){
                                  setState(() {
                                    _obscureText =!_obscureText;
                                  });
                                },
                                child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                              )
                            ),
                            style: TextStyle(
                              color: Colors.white
                            ),
                            controller: passwordController,
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return ("Mật khẩu bắt buộc để đăng nhập");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Mật khẩu không hợp lệ");
                              }
                            },
                            onSaved: (value) {
                              passwordController.text = value!;
                            },
                            obscureText: _obscureText,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                              width: 1),
                          borderRadius: BorderRadius.circular(30)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "Recovery Password",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color.fromRGBO(174, 174, 174, 1)),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            signInSignUpButton(context, true, (){
              FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text,
                  password: passwordController.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              }).onError((error, stackTrace) {
                showFaileMessage();
              });
            }),
            SizedBox(
              height: 35,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 137),
                      child: Image.asset('images/logo_google.png'),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 59),
                      child: Image.asset('images/logo_apple.png'),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              margin: EdgeInsets.only(left: 98),
              child: Center(
                  child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Text(
                          'Not A Member ? ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color.fromRGBO(219, 219, 219, 1)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => register()));
                        },
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(40, 140, 233, 1)),
                        ),
                      )
                    ],
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
