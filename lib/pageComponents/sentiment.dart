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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: "Sentiment",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "${convertNumber(data["sentiment"])}%",
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    // Expanded(
                    //   child: SfSparkAreaChart(),
                    // ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Expanded(
                      child: Text("🙂 positive"),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text("${convertNumber(data["positive"])}📈")
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Text("😐 neutral"),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text("${convertNumber(data["neutral"])}📈")
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Text("🙁 negative"),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text("${convertNumber(data["negative"])}📈")
                      ),
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
