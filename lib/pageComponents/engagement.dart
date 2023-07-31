import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Engagement extends StatefulWidget {
  const Engagement({super.key});

  @override
  _EngagementState createState() => _EngagementState();
}

class _EngagementState extends State<Engagement> {
  static var data = {
    "engagement": 712900,
    "reactions": 220000,
    "comments": 7200,
    "shares": 1100,
    "views": 484500,
    "dataset": "placeholder",
  };

  String convertNumber(var value) {
    if (value < 1000) {
      return value.toString();
    } else if (value >= 10000000) {
      return (value / 1000000).toString() + "M";
    } else {
      return (value / 1000).toString() + "K";
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
    return Container(
      width: 330,
      height: 300,
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
                        text: "Engagement",
                        style: TextStyle(color: Colors.orange, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: convertNumber(data["engagement"]),
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
                      data: [
                        (data['reactions'] as num).toDouble(),
                        (data['engagement'] as num).toDouble(),
                        (data['comments'] as num).toDouble(),
                        (data['views'] as num).toDouble(),
                      ],
                      axisLineColor: Colors  .black, // Optional: This line hides the axis lines
                      color: Color.fromARGB(255, 249, 223, 185),
                      borderWidth: 2,
                      borderColor:
                          Colors.orange, // Optional: Change the sparkline color
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
                        FontAwesomeIcons.thumbsUp,
                        size: 20, //Icon Size
                        color: Color.fromARGB(255, 0, 0, 0),
                      ), // Replace with the desired icon
                      SizedBox(
                          width:
                              5), // Add some spacing between the icon and the text
                      Text("Reactions"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(convertNumber(data["reactions"])),
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
                        FontAwesomeIcons.commentDots,
                        size: 20, //Icon Size
                        color: Color.fromARGB(255, 0, 0, 0),
                      ), // Replace with the desired icon
                      SizedBox(
                          width:
                              5), // Add some spacing between the icon and the text
                      Text("comments"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(convertNumber(data["comments"])),
                          const SizedBox(
                              width:
                                  5), // Add some spacing between the icon and the text
                          const Icon(trending_down,
                              color:
                                  Colors.red), // Replace with the desired icon
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
                        FontAwesomeIcons.share,
                        size: 20, //Icon Size
                        color: Color.fromARGB(255, 0, 0, 0),
                      ), // Replace with the desired icon
                      SizedBox(
                          width:
                              5), // Add some spacing between the icon and the text
                      Text("shares"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(convertNumber(data["shares"])),
                          const SizedBox(
                              width:
                                  5), // Add some spacing between the icon and the text
                          const Icon(trending_down,
                              color:
                                  Colors.red), // Replace with the desired icon
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
                        FontAwesomeIcons.eye,
                        size: 20, //Icon Size
                        color: Color.fromARGB(255, 0, 0, 0),
                      ), // Replace with the desired icon
                      SizedBox(
                          width:
                              5), // Add some spacing between the icon and the text
                      Text("views"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(convertNumber(data["views"])),
                          const SizedBox(
                              width:
                                  5), // Add some spacing between the icon and the text
                          const Icon(trending_down,
                              color:
                                  Colors.red), // Replace with the desired icon
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
