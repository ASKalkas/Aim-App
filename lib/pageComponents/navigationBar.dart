import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_input/pages/engagementGraphPage.dart';
import '../pages/pieChart.dart';
import '../pages/generalStats.dart';
import '../main.dart';

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
  late AppState appState;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Navigate to the corresponding page based on the selected label
    switch (index) {
      case 0:
        appState.setPage(const GeneralStats());
        break;
      case 1:
        appState.setPage(PieChart());
        break;
      case 2:
        appState.setPage(const EngagementGraphPage());
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
    appState = context.watch<AppState>();
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 84, 198, 28),
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
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'My Profile',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 255, 171, 62),
      unselectedItemColor: Color.fromARGB(255, 254, 222, 135),
      onTap: _onItemTapped,
      currentIndex: _selectedIndex, // Set the current selected index
    );
  }
}
