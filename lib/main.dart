import "package:flutter/material.dart";
import "package:text_input/pages/generalStats.dart";
import "package:text_input/pages/homePage.dart";
import "package:text_input/pages/loadingPage.dart";
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
// import "pages/generalStats.dart";
// import 'pages/logIn.dart';
// import "pages/chart_test.dart";

void main() {
  runApp(RunMyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
          title: "Aim-App",
          theme: ThemeData(primarySwatch: Colors.pink),
          home: LoadingPage(),
        ));
  }
}

class AppState extends ChangeNotifier {
  var token = "token";
  var username = "username";
  Widget page = const GeneralStats();

  void printTest() {
    debugPrint("Token: $token");
    debugPrint("username: $username");
  }

  void setPage(Widget tmp){
    page = tmp;
    debugPrint("done");
    notifyListeners();
  }
}
