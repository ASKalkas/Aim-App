import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const RunMyApp());
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aim-App",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: DoughnutChart(),
    );
  }
}

class DoughnutChart extends StatelessWidget {
  const DoughnutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Level Drill-Down Doughnut Chart'),
      ),
      body: const Center(
        child: SentimentDoughnut(),
      ),
    );
  }
}

class SentimentDoughnut extends StatefulWidget {
  const SentimentDoughnut({super.key});

  @override
  _SentimentDoughnutState createState() => _SentimentDoughnutState();
}

class _SentimentDoughnutState extends State<SentimentDoughnut> {
  List<ChartSampleData> data = [];

  static var response = {
    "sentiment": [
      {
        "key": "negative",
        "value": 31,
        "color": Colors.red,
        "drivers": [
          {"key": "Prices/الأسعار", "value": 17},
          {"key": "Package/العبوة", "value": 6},
          {"key": "Ads/الإعلانات", "value": 5},
          {"key": "الحجم/Size&Quantity", "value": 4},
          {"key": "Availability/التوفر", "value": 3},
          {"key": "الصحة/Health", "value": 0},
        ],
      },
      {
        "key": "neutral",
        "value": 5,
        "color": Colors.grey,
        "drivers": [
          {"key": "Prices/الأسعار", "value": 2},
          {"key": "Package/العبوة", "value": 2},
          {"key": "Ads/الإعلانات", "value": 1},
          {"key": "الحجم/Size&Quantity", "value": 0},
          {"key": "Availability/التوفر", "value": 0},
          {"key": "الصحة/Health", "value": 0},
        ],
      },
      {
        "key": "positive",
        "value": 4,
        "color": Colors.green,
        "drivers": [
          {"key": "Prices/الأسعار", "value": 2},
          {"key": "Package/العبوة", "value": 2},
          {"key": "Ads/الإعلانات", "value": 1},
          {"key": "الحجم/Size&Quantity", "value": 0},
          {"key": "Availability/التوفر", "value": 0},
          {"key": "الصحة/Health", "value": 0},
        ],
      },
    ],
  };

  int _level = 0;
  int currIndex = -1;

  Color _randomColor(){
    int a = 255;
    int r = Random().nextInt(256);
    int g = Random().nextInt(256);
    int b = Random().nextInt(256);
    return Color.fromARGB(a, r, g, b);
  }

  void _onDataLabelTapped(ChartPointDetails details) {
    if (_level < 1) {
      setState(() {
        _level++;
        switch(details.dataPoints![details.pointIndex!].x.toString()){
          case "negative": currIndex = 0; break;
          case "neutral": currIndex = 1; break;
          case "positive": currIndex = 2; break;
          default: currIndex = -1;
        }
        _fillData();
      });
    }
  }

  void _fillData() {
    data.clear();
    switch (_level) {
      case 0:
        for (int i = 0; i < response["sentiment"]!.length; i++) {
          if(response["sentiment"]![i]["value"] as int == 0){
            continue;
          }
          data.add(ChartSampleData(
              response["sentiment"]![i]["key"].toString(),
              response["sentiment"]![i]["value"] as int,
              response["sentiment"]![i]["color"] as Color));
        }
        break;
      case 1:
        for (int i = 0; i < (response["sentiment"]![currIndex]["drivers"]! as List).length; i++) {
          data.add(ChartSampleData(
              (response["sentiment"]![currIndex]["drivers"]! as List)[i]["key"].toString(),
              (response["sentiment"]![currIndex]["drivers"]! as List)[i]["value"] as int,
              _randomColor()));
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return Stack(
      children: [
        Center(
          child: SfCircularChart(
            series: <DoughnutSeries<ChartSampleData, String>>[
              DoughnutSeries<ChartSampleData, String>(
                dataSource: data,
                pointColorMapper: (ChartSampleData data, _) => data.color,
                xValueMapper: (ChartSampleData data, _) => data.x,
                yValueMapper: (ChartSampleData data, _) => data.y,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                dataLabelMapper: (ChartSampleData data, _) => data.x,
                //explode: true,
                explodeIndex: 0,
                explodeOffset: '10%',
                explodeAll: true,
                onPointTap: _onDataLabelTapped,
              ),
            ],
          ),
        ),
        Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_level > 0) {
                    _level--;
                    _fillData();
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Text("Back"),
            ),
          ),
        ),
      ],
    );
  }
}

class ChartSampleData {
  final String x;
  final int y;
  final Color color;

  ChartSampleData(this.x, this.y, this.color);
}
