import 'package:flutter/material.dart';

import 'package:demo1_app/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo 1',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[900],
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.white
          )
        ),
        primaryIconTheme: IconThemeData (
          color: Colors.white
        )
      ),
      home: App(),
    );
  }
}