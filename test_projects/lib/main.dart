import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_projects/login_screen.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [

           Padding(
            padding: const EdgeInsets.all(8.0),

            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: ElevatedButton(
                  child: Text(
                    "Go to Second screen",
                    style: TextStyle(color: Colors.black, fontSize: 25, fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {

                    //navigate to Second screen
                    Get.to(Second());
                  }
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ElevatedButton(
                  child: Text(
                    "Go To Login Screen",
                    style: TextStyle(color: Colors.black, fontSize: 25, fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {

                    //navigate to Second screen
                    Get.to(LoginScreen());
                  }
              ),
            ),
          ),
        ],

      ),
    );
  }


}
