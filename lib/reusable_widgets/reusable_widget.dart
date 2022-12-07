import 'package:flutter/material.dart';

Container signInSignUpButton(
  BuildContext context, bool isLogin, Function onTap
){
  return Container(
    width: 325,
    height: 80,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90)
    ),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      child: Text(
        isLogin ? 'Sign In' : 'Creat Account',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          fontFamily: 'Satoshi-bold'
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)){
            return Colors.black26;
          }
          return Color.fromRGBO(66, 200, 60, 1);
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
      ),
    ),
  );
}