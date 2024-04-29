import 'dart:convert';

import 'package:flutter/material.dart';

import 'albums_model.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  Future<List<Albums>> fetchAlbum() async {
    var http;
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      List<Albums> albums = [];

      List<dynamic> albumsJson = jsonDecode(response.body);

      albumsJson.forEach(
        (oneAlbum) {
          Albums album = Albums.fromJson(oneAlbum);
          albums.add(album);
        },
      );
      print(albums);
      return albums;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter API App')),
        body: Center(
          child: FutureBuilder<List<Albums>>(
            future: fetchAlbum(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Albums>? resData = snapshot.data;
                return ListView.builder(
                    itemCount: resData != null ? resData.length : 0,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(resData?[index].title ?? ""),
                        ),
                      );
                    });
              }

              // if (snapshot.hasData) {
              //   return Text(snapshot.data!.title);
              // } else if (snapshot.hasError) {
              //   return Text('${snapshot.error}');
              // }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
