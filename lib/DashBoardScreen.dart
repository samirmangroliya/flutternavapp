import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {

  var nameFromIntro = "";

  DashBoardScreen({required this.nameFromIntro});

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
              "Hello $nameFromIntro",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
