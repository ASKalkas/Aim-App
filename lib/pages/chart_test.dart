import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  var data = {
    "data": {
      "labels": [
        "arabic",
        "english",
        "emojis",
        "spanish",
        "german",
        "french",
        "italian",
        "franco",
        "portuguese",
        "others"
      ],
      "datasets": [
        {
          "data": [5089, 461, 288, 13, 14, 47, 11, 113, 3, 141],
          "backgroundColor": [
            "#54C0E8",
            "#E81F76",
            "#FFD639",
            "#c00021",
            "#F78F26",
            "#D4AFB9",
            "#279185",
            "#345995",
            "#C3941D",
            "#A82F01"
          ]
        }
      ]
    }
  };

  List<ChartData> convertData(var data) {
    List<ChartData> res = <ChartData>[];
    for (var i = 0; i < data["data"]["labels"].length; i++) {
      var record = ChartData(
          data["data"]["labels"][i],
          data["data"]["datasets"][0]["data"][i],
          data["data"]["datasets"][0]["backgroundColor"][i]);
      res.add(record);
    }
    return res;
  }

  // final pieData = json.decode(data);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = convertData(data);
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: SfCircularChart(
              borderColor: Color.fromRGBO(0, 0, 0, 1),
              borderWidth: 1,
              legend:
                  const Legend(isVisible: true, position: LegendPosition.right),
              series: <CircularSeries>[
                // Render pie chart
                PieSeries<ChartData, String>(
                    explode: true,
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => Color(
                        int.parse(data.color.substring(1, 7), radix: 16) +
                            0xFF000000),
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y)
              ]),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final num y;
  final String color;
}
