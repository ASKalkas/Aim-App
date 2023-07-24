import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Followers extends StatefulWidget {
  const Followers({super.key});

  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  static var data = {
    "followers": 22100000,
    "facebook": 16500000,
    "instagram": 1600000,
    "twitter": 1900000,
    "youtube": 2100000,
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
                        text: "Followers",
                        style:
                            TextStyle(color: Colors.purpleAccent, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: convertNumber(data["followers"]),
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
                        (data['facebook'] as num).toDouble(),
                        (data['twitter'] as num).toDouble(),
                        (data['followers'] as num).toDouble(),
                        (data['youtube'] as num).toDouble(),
                      ],
                      axisLineColor: Colors
                          .black, // Optional: This line hides the axis lines
                      color: const Color.fromARGB(255, 226, 155, 239),
                      borderWidth: 2,
                      borderColor: Colors
                          .purpleAccent, // Optional: Change the sparkline color
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
                      Text("Facebook"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(convertNumber(data["facebook"])),
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
                      Text("Instagram"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(convertNumber(data["instagram"])),
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
                          sentiment_dissatisfied_outlined), // Replace with the desired icon
                      SizedBox(
                          width:
                              5), // Add some spacing between the icon and the text
                      Text("Twitter"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(convertNumber(data["twitter"])),
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
                          sentiment_dissatisfied_outlined), // Replace with the desired icon
                      SizedBox(
                          width:
                              5), // Add some spacing between the icon and the text
                      Text("Youtube"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(convertNumber(data["youtube"])),
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
