import 'package:flutter/material.dart';
import 'package:any_screen/any_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: Container(
              child: Text('Hello World').padding(EdgeInsets.all(10)),
            ),
          ),
        ));
  }
}
