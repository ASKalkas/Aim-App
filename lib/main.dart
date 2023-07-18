import "package:flutter/material.dart";
import 'pages/logIn.dart';

void main() => runApp(const RunMyApp());

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Retrieve Text Input",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
    );
  }
}
