import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Second.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: First(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx State Managements"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
              child: Text(
                "Go to next screen",
                style: TextStyle(color: Colors.black, fontSize: 25, fontStyle: FontStyle.normal),
              ),
              onPressed: () {

                //navigate to Second screen
                Get.to(Second());
              }
          ),
        ),
      ),
    );
  }


}
