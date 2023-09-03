import "dart:convert";
import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
import "../main.dart";
import "../GlobalMethods/api.dart";
import "../GlobalMethods/pdf.dart";

class EngagementGraph extends StatefulWidget {
  const EngagementGraph({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  _EngagementGraphState createState() => _EngagementGraphState(index);
}

class _EngagementGraphState extends State<EngagementGraph> {
  _EngagementGraphState(this.index);

  var response = {};
  late AppState appState;
  final index;
  final GlobalKey _graphKey = GlobalKey();

  String getName() {
    switch (index) {
      case 0:
        return "Engagement";
      case 1:
        return "Views";
      case 2:
        return "Comments";
      case 3:
        return "Self-Comments";
      case 4:
        return "Reactions";
      case 5:
        return "Shares";
      default:
        throw UnimplementedError();
    }
  }

  Color getColor() {
    switch (index) {
      case 0:
        return Colors.lightGreen;
      case 1:
        return const Color.fromARGB(255, 54, 202, 236);
      case 2:
        return Colors.blue;
      case 3:
        return Colors.red;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.purple;
      default:
        throw UnimplementedError();
    }
  }

  Future<String> getData() async {
    var data = {
      "dashboardId": "12001",
      "visualizationId": 92000,
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
    // debugPrint(res.statusCode.toString());
    //debugPrint(response["data"]["elasticResponse"]["response"]["data"]["line"]["datasets"][0]["data"][0].toString());
    return "Done";
  }

  List<ChartData> convertList() {
    List dates = response["data"]["elasticResponse"]["response"]["data"]
        ["Total Engagement"]["labels"];
    List values = response["data"]["elasticResponse"]["response"]["data"]
        ["Total Engagement"]["datasets"][index]["data"];

    List<ChartData> result = [];

    for (int i = 0; i < dates.length; i++) {
      result.add(ChartData(date: dates[i].substring(0, 10), value: values[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    appState = context.watch<AppState>();
    return FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapShot) {
          if (snapShot.hasData) {
            return Container(
              width: 330,
              height: 400,
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
              child: Column(
                children: [
                  RepaintBoundary(
                    key: _graphKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(labelRotation: 290),
                        title: ChartTitle(text: getName()),
                        // legend: const Legend(isVisible: true),
                        series: <SplineSeries<ChartData, String>>[
                          SplineSeries<ChartData, String>(
                            color: getColor(),
                            dataSource: convertList(),
                            xValueMapper: (ChartData data, _) => data.date,
                            yValueMapper: (ChartData data, _) => data.value,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => {ExportPdf.renderPDF(_graphKey)},
                      child: Text("Export")),
                ],
              ),
            );
          } else {
            return Container(
                width: 50,
                height: 50,
                child: const CircularProgressIndicator());
          }
        });
  }
}

class ChartData {
  ChartData({required String this.date, required this.value});

  String date;
  num value;
}
