import "package:flutter/material.dart";
import 'pages/loadingPage.dart';

void main() => runApp(const RunMyApp());

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Map<int, Color> color ={
    //   50:const Color.fromRGBO(233,29,118, .1),
    //   100:const Color.fromRGBO(233,29,118, .2),
    //   200:const Color.fromRGBO(233,29,118, .3),
    //   300:const Color.fromRGBO(233,29,118, .4),
    //   400:const Color.fromRGBO(233,29,118, .5),
    //   500:const Color.fromRGBO(233,29,118, .6),
    //   600:const Color.fromRGBO(233,29,118, .7),
    //   700:const Color.fromRGBO(233,29,118, .8),
    //   800:const Color.fromRGBO(233,29,118, .9),
    //   900:const Color.fromRGBO(233,29,118, 1),
    // };
    return MaterialApp(
      title: "Retrieve Text Input",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const LoadingPage(),
    );
  }
}