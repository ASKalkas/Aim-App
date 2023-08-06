import 'package:flutter/material.dart';
import '../pageComponents/pieChart.dart';
import '../pageComponents/NSS.dart';

class CircularCharts extends StatefulWidget {
  const CircularCharts({super.key});

  @override
  _CircularChartsState createState() => _CircularChartsState();
}

class _CircularChartsState extends State<CircularCharts> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              PieChart(),
              const SizedBox(height: 20),
              NSS(),
            ],
          ),
        ),
      ),
    );
  }
}
