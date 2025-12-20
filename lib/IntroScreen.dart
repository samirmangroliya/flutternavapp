import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternavapp/DashBoardScreen.dart';

class IntroScreen extends StatelessWidget {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Intro")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hello Developers move to next page.",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter Your Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashBoardScreen(nameFromIntro: nameController.text.toString()),
                  ),
                );
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
