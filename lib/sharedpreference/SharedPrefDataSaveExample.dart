import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDataSaveExample extends StatefulWidget {
  @override
  State<SharedPrefDataSaveExample> createState() =>
      _SharedPrefDataSaveExampleState();
}

class _SharedPrefDataSaveExampleState extends State<SharedPrefDataSaveExample> {
  var nameController = TextEditingController();
  static const String KEYNAME = "name";
  var nameValue = "";

  @override
  void initState() {
    super.initState();

    getValue();
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
                "Please Enter Your Name to ",
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
                  prefs.setString(KEYNAME, name);
                },
                child: Text("Save"),
              ),
              SizedBox(height: 30),
              Text("Saved Value::\n$nameValue"),
            ],
          ),
        ),
      ),
    );
  }

  void getValue() async {
      var prefs = await SharedPreferences.getInstance();
      var name = prefs.getString(KEYNAME);
      nameValue = name != null ? name : "No Value Saved";
      setState(() {

      });
  }
}
