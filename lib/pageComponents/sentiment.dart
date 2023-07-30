import "dart:convert";
import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:provider/provider.dart';
import "../main.dart";
import "../api/api.dart";

class Sentiment extends StatefulWidget {
  const Sentiment({super.key});

  @override
  _SentimentState createState() => _SentimentState();
}

class _SentimentState extends State<Sentiment> {
  static var data = {
    "sentiment": 54,
    "positive": 1900,
    "neutral": 2600,
    "negative": 1700,
    "dataset": "placeholder",
  };

  static var response = {};

  String convertNumber(var value) {
    if (value < 1000) {
      return value.toString();
    } else if (value >= 10000000) {
      return (value / 1000000).toString() + "M";
    } else {
      return (value / 1000).toString() + "K";
    }
  }

  int fixSentiment(double sentiment){
    return (sentiment * 100).round();
  }

  List<num> convertList(List list) {
    List<num> result = [];

    for (var x in list) {
      result.add(x as num);
    }

    return result;
  }

  Future<String> getData(var appState) async {
    var data = {
      "dashboardId": "12001",
      "visualizationId": 92005,
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

  static const IconData sentiment_satisfied_alt_outlined =
      IconData(0xf35d, fontFamily: 'MaterialIcons');
  static const IconData sentiment_dissatisfied_outlined =
      IconData(0xf35b, fontFamily: 'MaterialIcons');
  static const IconData sentiment_neutral_outlined =
      IconData(0xf35c, fontFamily: 'MaterialIcons');
  static const IconData trending_up =
      IconData(0xe67f, fontFamily: 'MaterialIcons', matchTextDirection: true);
  static const IconData trending_down =
      IconData(0xe67d, fontFamily: 'MaterialIcons', matchTextDirection: true);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return FutureBuilder<String>(
        future: getData(appState),
        builder: (context, AsyncSnapshot<String> snapShot) {
          if (snapShot.hasData) {
            return Container(
              width: 330,
              height: 250,
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "Sentiment",
                                style: TextStyle(
                                    color: Colors.lightBlue, fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: "${convertNumber((response["data"]
                                        ["elasticResponse"]["response"]["data"]
                                    ["card"][0]["value"] * 100).round())}%",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height:
                                60, // Adjust the height of the chart to your desired size
                            child: SfSparkAreaChart(
                              data: convertList(response["data"]
                                      ["elasticResponse"]["response"]["data"]
                                  ["line"]["datasets"][0]["data"]),
                              axisLineColor: Colors
                                  .black, // Optional: This line hides the axis lines
                              color: const Color.fromARGB(190, 170, 225, 251),
                              borderWidth: 2,
                              borderColor: Colors
                                  .blue, // Optional: Change the sparkline color
                              // gradient: LinearGradient(
                              //   colors: [
                              //     Colors.blue.withOpacity(0.2),
                              //     Colors.blue.withOpacity(0.8),
                              //   ],
                              //   begin: Alignment.bottomCenter,
                              //   end: Alignment.topCenter,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Expanded(
                          child: Row(
                            children: [
                              Icon(
                                  sentiment_satisfied_alt_outlined), // Replace with the desired icon
                              SizedBox(
                                  width:
                                      5), // Add some spacing between the icon and the text
                              Text("Positive"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(convertNumber(response["data"]
                                        ["elasticResponse"]["response"]["data"]
                                    ["card"][1]["value"])),
                                  const SizedBox(
                                      width:
                                          5), // Add some spacing between the icon and the text
                                  const Icon(trending_up,
                                      color: Colors
                                          .green), // Replace with the desired icon
                                ],
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(
                          child: Row(
                            children: [
                              Icon(
                                  sentiment_neutral_outlined), // Replace with the desired icon
                              SizedBox(
                                  width:
                                      5), // Add some spacing between the icon and the text
                              Text("Neutral"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(convertNumber(response["data"]
                                        ["elasticResponse"]["response"]["data"]
                                    ["card"][2]["value"])),
                                  const SizedBox(
                                      width:
                                          5), // Add some spacing between the icon and the text
                                  const Icon(trending_down,
                                      color: Colors
                                          .red), // Replace with the desired icon
                                ],
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(
                          child: Row(
                            children: [
                              Icon(
                                  sentiment_dissatisfied_outlined), // Replace with the desired icon
                              SizedBox(
                                  width:
                                      5), // Add some spacing between the icon and the text
                              Text("Negative"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(convertNumber(response["data"]
                                        ["elasticResponse"]["response"]["data"]
                                    ["card"][3]["value"])),
                                  const SizedBox(
                                      width:
                                          5), // Add some spacing between the icon and the text
                                  const Icon(trending_down,
                                      color: Colors
                                          .red), // Replace with the desired icon
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }else{
            return CircularProgressIndicator();
          }
        });
  }
}
