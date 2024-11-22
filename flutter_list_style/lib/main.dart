import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TOD: implement build
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("Hafiz"),
              subtitle: Text("Sub Tittle"),
              leading: CircleAvatar(),
              trailing: Text("10.00pm"), 
              dense: true,
              tileColor: Colors.yellow,
        ),
        Divider(
          color: Colors.yellow,
        ),
      ],
    )
  ),
);
  }
}