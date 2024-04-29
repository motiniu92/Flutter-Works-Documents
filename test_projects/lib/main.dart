import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Second.dart';
import 'login_screen.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text('Fetch Data Example',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold)),

        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.black26,
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: ElevatedButton(
                          child: Text(
                            "Go to Second screen",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {
                            //navigate to Second screen
                            //Second();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new Second()));
                          }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!.title,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          fontStyle: FontStyle.normal),

                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:test_projects/login_screen.dart';
// import 'package:test_projects/post_page.dart';
//
// import 'Second.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: First(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class First extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Getx State Managements"),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                   child: Text(
//                     "Go to Second screen",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 25,
//                         fontStyle: FontStyle.normal),
//                   ),
//                   onPressed: () {
//                     //navigate to Second screen
//                     //Second();
//
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Second()));
//                   }),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               child: ElevatedButton(
//                   child: Text(
//                     "Go To Login Screen",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 25,
//                         fontStyle: FontStyle.normal),
//                   ),
//                   onPressed: () {
//                     //navigate to Second screen
//
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => LoginScreen()));
//                   }),
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               child: ElevatedButton(
//                   child: Text(
//                     "Go To Post Page",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 25,
//                         fontStyle: FontStyle.normal),
//                   ),
//                   onPressed: () {
//                     //navigate to Second screen
//
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => PostsPage()));
//                   }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
