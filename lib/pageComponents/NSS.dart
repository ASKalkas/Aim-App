import "dart:convert";
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:provider/provider.dart';
import "../GlobalMethods/api.dart";
import '../main.dart';
import "../GlobalMethods/pdf.dart";

/// Represents MyHomePage class
class NSS extends StatefulWidget {
  /// Creates the instance of MyHomePage
  NSS({Key? key}) : super(key: key);

  @override
  _NSSState createState() => _NSSState();
}

class _NSSState extends State<NSS> {
  final GlobalKey _gaugeKey = GlobalKey();
  static var gaugeValue;
  static var appState;

  Future<String> getData() async {
    var data = {
      "dashboardId": "12001",
      "visualizationId": 92013,
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
    gaugeValue = ((json.decode(res.body))["data"]["elasticResponse"]['response']
                ['raw']["data"][0]["sum_value"] *
            100)
        .toStringAsFixed(1);
    // debugPrint(res.statusCode.toString());
    //debugPrint(response["data"]["elasticResponse"]["response"]["data"]["line"]["datasets"][0]["data"][0].toString());
    return "Done";
  }

  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return Center(
        child: SfRadialGauge(
            title: GaugeTitle(
                text: 'NSS',
                textStyle: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.normal)),
            axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 12.5,
                color: Colors.red[600],
                startWidth: 20,
                endWidth: 20),
            GaugeRange(
                startValue: 12.5,
                endValue: 25,
                color: Colors.red[400],
                startWidth: 20,
                endWidth: 20),
            GaugeRange(
                startValue: 25,
                endValue: 37.5,
                color: Colors.red[200],
                startWidth: 20,
                endWidth: 20),
            GaugeRange(
                startValue: 37.5,
                endValue: 50,
                color: Colors.red[100],
                startWidth: 20,
                endWidth: 20),
            GaugeRange(
                startValue: 50,
                endValue: 62.5,
                color: Colors.green[100],
                startWidth: 20,
                endWidth: 20),
            GaugeRange(
                startValue: 62.5,
                endValue: 75,
                color: Colors.green[200],
                startWidth: 20,
                endWidth: 20),
            GaugeRange(
                startValue: 75,
                endValue: 87.5,
                color: Colors.green[400],
                startWidth: 20,
                endWidth: 20),
            GaugeRange(
                startValue: 87.5,
                endValue: 100,
                color: Colors.green[600],
                startWidth: 20,
                endWidth: 20)
          ], pointers: <GaugePointer>[
            NeedlePointer(value: double.parse(gaugeValue)),
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text('$gaugeValue %',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]));
  }

  Widget _getLinearGauge() {
    return Container(
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: LinearTickStyle(length: 30),
          axisLabelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
          axisTrackStyle: LinearAxisTrackStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 25.0,
              borderColor: Colors.grey)),
      margin: EdgeInsets.all(15),
    );
  }

  @override
  Widget build(BuildContext context) {
    appState = context.watch<AppState>();
    return FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 420,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RepaintBoundary(
                      // Step 2: Wrap the gauge with RepaintBoundary
                      key: _gaugeKey,
                      child: _getGauge(),
                    ),
                    ElevatedButton(
                        onPressed: () => {ExportPdf.renderPDF(_gaugeKey)},
                        child: Text("Export"))
                  ],
                ),
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
