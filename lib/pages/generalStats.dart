import "package:flutter/material.dart";
import "../pageComponents/engagement.dart";
import "../pageComponents/sentiment.dart";
import "../pageComponents/followers.dart";
import '../pageComponents/navigationBar.dart';

class GeneralStats extends StatefulWidget {
  const GeneralStats({super.key});

  @override
  State<GeneralStats> createState() => GeneralStatsState();
}

class GeneralStatsState extends State<GeneralStats> {
  var res = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView(children: [
            Center(child: Followers()),
            SizedBox(height: 30),
            Center(child: Sentiment()),
            SizedBox(height: 30),
            Center(child: Engagement()),
          ])),
          SafeArea(
            child: BottomNavigationBarExample(),
          )
        ],
      ),
    );
  }
}
