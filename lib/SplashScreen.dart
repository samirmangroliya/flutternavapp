import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutternavapp/IntroScreen.dart';
import 'package:flutternavapp/sharedpreference/SharedPrefDataSaveExample.dart';
import 'package:flutternavapp/sharedpreference/SuccessFullyLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/Constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    timeDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text(
                "Welcome To App",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void timeDelay() {
    Timer(Duration(seconds: 2), () {
      goToNextScreen();
    });
  }

  void goToNextScreen() async {
    var prefs = await SharedPreferences.getInstance();
    var name = prefs.getString(Constants.KEYNAME);

    if (name != null && name.toString().isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) {
            return SuccessFullyLogin(nameFromIntro: name.toString());
          }),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) {
            return SharedPrefDataSaveExample();
          }),
        ),
      );
    }
  }
}
