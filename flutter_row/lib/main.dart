import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build (BuildContext context) {
    // TODO: implement build
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
      title: Text("My App"),
      ), // AppBar
      body: Row (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
            width: 200,
            height: 20,
            color: Colors.green,

            ),
            Container(
            width: 200,
            height: 20,
            color: Colors.yellow,

            ),
            Container(
            width: 200,
            height: 20,
            color: Colors.blue,

            ),
            Container(
            width: 200,
            height: 20,
            color: Colors.amber,

            ),
             // Container
          ]
        ) // Row
      ), // Scaffold
    ); // MaterialApp
}
}
