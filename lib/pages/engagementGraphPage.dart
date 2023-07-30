import 'package:flutter/material.dart';
import '../pageComponents/engagementGraph.dart';

class EngagementGraphPage extends StatelessWidget{
  const EngagementGraphPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          EngagementGraph(index: 0),
          SizedBox(height: 30),
          EngagementGraph(index: 1),
          SizedBox(height: 30),
          EngagementGraph(index: 2),
          SizedBox(height: 30),
          EngagementGraph(index: 3),
          SizedBox(height: 30),
          EngagementGraph(index: 4),
        ],
      ),
    );
  }
}