import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Center(
            child: Text('I Am Poor'),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Image.asset('images/coal.png'),
        ),
      ),
    );
  }
}
