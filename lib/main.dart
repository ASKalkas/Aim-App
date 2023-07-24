import "package:flutter/material.dart";
import "package:text_input/pages/loadingPage.dart";
import "pages/generalStats.dart";
// import 'pages/logIn.dart';
// import "pages/chart_test.dart";

void main() => runApp(const RunMyApp());

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Retrieve Text Input",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: GeneralStats(),
    );
  }
}
