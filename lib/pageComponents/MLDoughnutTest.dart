import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Level Drill-Down Doughnut Chart'),
      ),
      body: Center(
        child: MultiLevelDrillDownDoughnutChart(),
      ),
    );
  }
}

class MultiLevelDrillDownDoughnutChart extends StatefulWidget {
  @override
  _MultiLevelDrillDownDoughnutChartState createState() =>
      _MultiLevelDrillDownDoughnutChartState();
}

class _MultiLevelDrillDownDoughnutChartState
    extends State<MultiLevelDrillDownDoughnutChart> {
  List<List<ChartSampleData>> data = [
    [
      ChartSampleData(
          'Category A', 30, const Color.fromARGB(255, 22, 149, 253)),
      ChartSampleData('Category B', 20, const Color.fromARGB(255, 58, 255, 64)),
      ChartSampleData('Category C', 50, Color.fromARGB(255, 254, 246, 3)),
    ],
    [
      ChartSampleData('Subcategory 1', 10, Colors.purple),
      ChartSampleData('Subcategory 2', 20, Colors.teal),
    ],
    [
      ChartSampleData('Sub-subcategory 1', 5, Colors.indigo),
      ChartSampleData('Sub-subcategory 2', 15, Colors.yellow),
    ],
  ];

  int _level = 0;

  void _onDataLabelTapped(ChartPointDetails args) {
    if (_level < data.length - 1) {
      setState(() {
        _level++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
          dataSource: data[_level],
          pointColorMapper: (ChartSampleData data, _) => data.color,
          xValueMapper: (ChartSampleData data, _) => data.x,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          explode: true,
          explodeIndex: 0,
          explodeOffset: '10%',
          explodeAll: true,
          onPointTap: _onDataLabelTapped,
        ),
      ],
    );
  }
}

class ChartSampleData {
  final String x;
  final double y;
  final Color color;

  ChartSampleData(this.x, this.y, this.color);
}
