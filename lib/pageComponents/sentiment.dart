import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

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

  String convertNumber(var value) {
    if (value < 1000) {
      return value.toString();
    } else if (value >= 1000) {
      return (value / 1000).toString() + "K";
    } else {
      return (value / 1000000).toString() + "M";
    }
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
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
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
                            text: "${convertNumber(data["sentiment"])}%",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Expanded(
                    //   child: SfSparkAreaChart(),
                    // ),
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
                              Text("${convertNumber(data["positive"])}"),
                              Icon(trending_up,
                                  color: Colors
                                      .green), // Replace with the desired icon
                              SizedBox(
                                  width:
                                      5), // Add some spacing between the icon and the text
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
                              Text("${convertNumber(data["neutral"])}"),
                              Icon(trending_down,
                                  color: Colors
                                      .red), // Replace with the desired icon
                              SizedBox(
                                  width:
                                      5), // Add some spacing between the icon and the text
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
                              Text("${convertNumber(data["negative"])}"),
                              Icon(trending_down,
                                  color: Colors
                                      .red), // Replace with the desired icon
                              SizedBox(
                                  width:
                                      5), // Add some spacing between the icon and the text
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
