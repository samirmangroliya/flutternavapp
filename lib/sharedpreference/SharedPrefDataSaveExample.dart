import 'package:flutter/material.dart';
import 'package:flutternavapp/constants/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SuccessFullyLogin.dart';

class SharedPrefDataSaveExample extends StatefulWidget {
  @override
  State<SharedPrefDataSaveExample> createState() =>
      _SharedPrefDataSaveExampleState();
}

class _SharedPrefDataSaveExampleState extends State<SharedPrefDataSaveExample> {
  var nameController = TextEditingController();


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Intro")),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Please Enter Your Name",
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
                onPressed: () async {
                  var name = nameController.text.toString();
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString(Constants.KEYNAME, name);
                  goToLoggedInScreen();
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void goToLoggedInScreen() async {
    var prefs = await SharedPreferences.getInstance();
    var name = prefs.getString(Constants.KEYNAME);

    if (name != null && name.toString().isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) =>
              SuccessFullyLogin(nameFromIntro: name.toString())),
        ),
      );
    }
  }
}
