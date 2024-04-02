import 'package:flutter/material.dart';

Widget CustomAuthButton({context, ontap, buttonText}) {
  var size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: size.width,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.blue[100]),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            // color: Colors.whi,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            // fontFamily: inter,
          ),
        ),
      ),
    ),
  );
}
