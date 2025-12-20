import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternavapp/constants/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SharedPrefDataSaveExample.dart';

class SuccessFullyLogin extends StatelessWidget {
  var nameFromIntro = "";

  SuccessFullyLogin({required this.nameFromIntro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Intro")),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You are successfully Logged in\n $nameFromIntro",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                clearData();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SharedPrefDataSaveExample(),
                  ),
                );
              },
              child: Text("Logout"),
            ),
            SizedBox(height: 30),
            Text(
              "You will remained logged in until you logout...\nRestart App to remain logged in",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(Constants.KEYNAME);
  }
}
