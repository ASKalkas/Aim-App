import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

/// Represents MyHomePage class
class NSS extends StatefulWidget {
  /// Creates the instance of MyHomePage
  NSS({Key? key}) : super(key: key);

  @override
  _NSSState createState() => _NSSState();
}

class _NSSState extends State<NSS> {
  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return Center(
        child: Container(
      height: 300,
      width: 300,
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
              NeedlePointer(value: 54)
            ], annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                      child: const Text('54 %',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  angle: 90,
                  positionFactor: 0.5)
            ])
          ]),
    ));
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
    return Scaffold(
        appBar: AppBar(title: const Text('Syncfusion Flutter Gauge')),
        body: _getGauge());
  }
}
