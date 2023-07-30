import 'package:flutter/material.dart';
import '../pages/chart_test.dart';
import '../pages/generalStats.dart';

/// Flutter code sample for [BottomNavigationBar].

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0; // Track the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Navigate to the corresponding page based on the selected label
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GeneralStats()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChartPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChartPage()),
        );
        break;
      default:
        break;
    }
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Pie Chart',
      style: optionStyle,
    ),
    Text(
      'Index 2: Line Chart',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: Colors.pink,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart),
          label: 'Pie Chart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.line_axis),
          label: 'Line Chart',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 255, 171, 62),
      onTap: _onItemTapped,
      currentIndex: _selectedIndex, // Set the current selected index
    );
  }
}
