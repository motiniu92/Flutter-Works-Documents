import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_projects/main.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
              child: Text(
                "Go to first screen", style: TextStyle(color: Colors.red, fontSize: 25, fontStyle: FontStyle.normal),
              ),
              onPressed: (){
                Get.to(First());
              }
          ),
        ),
      ),
    );
  }
}