import 'package:flutter/material.dart';
import 'package:myapp/view/authScreens/signUp.dart';
import 'package:get/get.dart';
import 'package:myapp/view/homescreens/homeScreen.dart';
import 'package:myapp/view-models/localStorage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserPreferences _userPreferences = UserPreferences();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      _userPreferences.getUserName().then((value) {
        if (value != null) {
          Get.to(HomeScreen());
        } else {
          Get.to(SignUp());
        }
      });

      Get.to(SignUp());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[100],
      body: Center(
          child: Image.asset(
        "assets/homeIcon.png",
        height: MediaQuery.of(context).size.height * 0.50,
      )),
    );
  }
}
