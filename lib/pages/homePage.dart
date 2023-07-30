import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "../main.dart";
import "../pageComponents/navigationBar.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: appState.page,
          ),
          const SafeArea(child: BottomNavigationBarExample(),)
        ],
      ),
    );
  }
}
