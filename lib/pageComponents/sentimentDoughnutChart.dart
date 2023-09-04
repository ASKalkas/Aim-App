import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../GlobalMethods/api.dart';
import '../GlobalMethods/pdf.dart';

class SentimentDoughnut extends StatefulWidget {
  const SentimentDoughnut({super.key});

  @override
  _SentimentDoughnutState createState() => _SentimentDoughnutState();
}

class _SentimentDoughnutState extends State<SentimentDoughnut> {
  List<ChartSampleData> data = [];
  late AppState appState;

  static var response = {};

  int _level = 0;
  int _currIndex = -1;
  final GlobalKey _donutKey = GlobalKey();

  Future<String> getData() async {
    var data = {
      "dashboardId": "12001",
      "visualizationId": 92006,
      "time_from": "2023-07-17T00:00:00.000Z",
      "time_to": "2023-07-24T23:59:59.999Z",
      "interval": "12h",
      "filters": {
        "entities": [
          {
            "key": "Dreem Egypt",
            "id": "694b35b8-d988-4635-8d81-a614491d1444",
            "value": true
          }
        ]
      },
      "second_from_date": "2023-07-10T00:00:00.000Z",
      "second_to_date": "2023-07-17T23:59:59.999Z"
    };
    Map<String, String> headers = {
      "x-access-token": appState.token,
      "Cookie": "is_migrated=true",
      "Content-type": "Application/json"
    };
    var res = await CallApi().postData(data, "load", headers);
    response = json.decode(res.body);
    debugPrint(res.statusCode.toString());
    //debugPrint(response["data"]["elasticResponse"]["response"]["data"]["line"]["datasets"][0]["data"][0].toString());
    return "Done";
  }

  String getTitle() {
    switch (_currIndex) {
      case 0:
        return "Neutral";
      case 1:
        return "Negative";
      case 2:
        return "Positive";
      default:
        return "Total";
    }
  }

  void _onDataLabelTapped(ChartPointDetails details) {
    if (_level < 1) {
      setState(() {
        _level++;
        switch (details.dataPoints![details.pointIndex!].x.toString()) {
          case "neutral":
            _currIndex = 0;
            break;
          case "negative":
            _currIndex = 1;
            break;
          case "positive":
            _currIndex = 2;
            break;
          default:
            _currIndex = -1;
        }
        _fillData();
      });
    }
  }

  void _fillData() {
    data.clear();
    switch (_level) {
      case 0:
        for (int i = 0;
            i <
                response["data"]["elasticResponse"]["response"]["data"]["data"]
                        ["children"]
                    .length;
            i++) {
          if (response["data"]["elasticResponse"]["response"]["data"]["data"]
                  ["children"][i]["doc_count"] as int ==
              0) {
            continue;
          }
          String name = response["data"]["elasticResponse"]["response"]["data"]
                  ["data"]["children"][i]["name"]
              .toString();
          data.add(ChartSampleData(
              name,
              response["data"]["elasticResponse"]["response"]["data"]["data"]
                  ["children"][i]["doc_count"] as int,
              Color(int.parse(
                  "0xff${response["data"]["elasticResponse"]["response"]["data"]["colors"][name].toString().replaceAll('#', '')}"))));
        }
        break;
      case 1:
        for (int i = 0;
            i <
                (response["data"]["elasticResponse"]["response"]["data"]["data"]
                        ["children"][_currIndex]["children"] as List)
                    .length;
            i++) {
          if (response["data"]["elasticResponse"]["response"]["data"]["data"]
                  ["children"][_currIndex]["children"][i]["doc_count"] as int ==
              0) {
            continue;
          }
          String name = response["data"]["elasticResponse"]["response"]["data"]
                  ["data"]["children"][_currIndex]["children"][i]["name"]
              .toString();
          data.add(ChartSampleData(
              name,
              response["data"]["elasticResponse"]["response"]["data"]["data"]
                  ["children"][_currIndex]["children"][i]["doc_count"] as int,
              Color(int.parse(
                  "0xff${response["data"]["elasticResponse"]["response"]["data"]["colors"][name].toString().substring(1)}"))));
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    appState = context.watch<AppState>();
    return FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapShot) {
          if (snapShot.hasData) {
            _fillData();
            return Container(
              height: 400,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffdddddd),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    RepaintBoundary(
                      key: _donutKey,
                      child: Center(
                        child: SfCircularChart(
                          title: ChartTitle(text: getTitle()),
                          legend: const Legend(
                              isVisible: true,
                              position: LegendPosition.right,
                              width: "30%"),
                          series: <DoughnutSeries<ChartSampleData, String>>[
                            DoughnutSeries<ChartSampleData, String>(
                              dataSource: data,
                              pointColorMapper: (ChartSampleData data, _) =>
                                  data.color,
                              xValueMapper: (ChartSampleData data, _) => data.x,
                              yValueMapper: (ChartSampleData data, _) => data.y,
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true),
                              dataLabelMapper: (ChartSampleData data, _) =>
                                  data.y.toString(),
                              //explode: true,
                              explodeIndex: 0,
                              explodeOffset: '10%',
                              explodeAll: true,
                              onPointTap: _onDataLabelTapped,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_level > 0) {
                              _level--;
                              _currIndex = -1;
                              _fillData();
                            }
                          });
                        },
                        child: const Text("Back"),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => {ExportPdf.renderPDF(_donutKey)},
                        child: const Text("Export"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class ChartSampleData {
  final String x;
  final int y;
  final Color color;

  ChartSampleData(this.x, this.y, this.color);
}
