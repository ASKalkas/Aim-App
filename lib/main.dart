import "package:flutter/material.dart";
import "package:text_input/pages/generalStats.dart";
import 'package:text_input/pages/homePage.dart';
import "package:text_input/pages/loadingPage.dart";
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'pageComponents/sentimentDoughnutChart.dart';

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
  var token =
      "eyJraWQiOiJNdWdycWRpdnRyamp6OUZNK290SnFyUlB6azk0SlpVOGt1WXFCZ1wvUFNMcz0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzYjI3YWI0Zi1mYmFkLTQ4MDQtYjE0OC02YzkyM2MxMzQ3ZGIiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtZWFzdC0yLmFtYXpvbmF3cy5jb21cL3VzLWVhc3QtMl9BMldtZHlTdEciLCJjbGllbnRfaWQiOiI0MjdvdmtwbmwyYnNwYnExYWR1YzMwODZ1OCIsIm9yaWdpbl9qdGkiOiI2ZjljYTEyMi1mMGRkLTQ2ZmYtOTgyNC01NDEwYjIwZjY5NmYiLCJldmVudF9pZCI6IjQ4MzI5ZDE0LTgyNjUtNGYxNS1iZWQwLWM0NmUwMmJjYzNjNyIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE2OTM3MjkyMDcsImV4cCI6MTY5MzgxNTYwNywiaWF0IjoxNjkzNzI5MjA3LCJqdGkiOiI3NWVhYmZmNi1jNzQxLTQwZjgtYjAxZC1jNzJlMDU2ZmMzNmQiLCJ1c2VybmFtZSI6InJldmFtcF8yMDIzIn0.LcuYjqIXC_PTA3ZQNmAtNbo0BPn5rb4txoKDaarDGEcmEcfIxa0fj_8c4fx1OMjwVVRW17wXnab0AJD7MKbS9170W-_NnPwuwE8c_wemPw8Y907ThKERKfgck2Vrh7wYMjC2hqWk9dJUSnrDFBM8Qo_TWSP7cPiJPkIpv1e6HA1J80UlubKcO5pmNsTulvayoIdZqKD8npQjS8_lDwLdgcqzVzj7wJrKx6otSV312ZO0a_fw_Hoi3oQOhCm-zkesSUh4zv9t1tTTHBKcfTYO1RtbNRTdb4si832mEquXP6kHdZUXaKiYokILHwupZgNne7V2wAuzrb3SxgyKNudU9g";
  var username = "Revamp_2023";
  var password = "Test@123";
  Widget page = const GeneralStats();

  void printTest() {
    debugPrint("Token: $token");
    debugPrint("username: $username");
  }

  void setPage(Widget tmp) {
    page = tmp;
    debugPrint("done");
    notifyListeners();
  }
}
