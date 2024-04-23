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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: 400,
                child: ElevatedButton(
                    child: Text(
                      "Go to first screen",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          fontStyle: FontStyle.normal),
                    ),
                    onPressed: () {
                      Get.to(First());
                    }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              color: Colors.black12,
              child: Text(
                "Hello Delopers What is the problem, don't wary each problem have a solution in the programing sector",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontStyle: FontStyle.normal),
                overflow: TextOverflow.ellipsis,
                // I used ellipsis, but it works with others (fade, clip, etc.)
                maxLines: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
