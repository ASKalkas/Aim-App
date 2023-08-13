import 'package:flutter/material.dart';
import '../pageComponents/pieChart.dart';
import '../pageComponents/NSS.dart';
import '../pageComponents/sentimentDoughnutChart.dart';

class CircularCharts extends StatefulWidget {
  const CircularCharts({super.key});

  @override
  _CircularChartsState createState() => _CircularChartsState();
}

class _CircularChartsState extends State<CircularCharts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Center(child: PieChart()),
            const SizedBox(height: 20),
            Center(child: NSS()),
            const SizedBox(height: 20),
            const Center(child: SentimentDoughnut()),
          ],
        ),
    );
  }
}
