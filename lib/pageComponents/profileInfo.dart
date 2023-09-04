import "dart:convert";
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "../main.dart";
import "../GlobalMethods/api.dart";

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});
  static var response = {};
  static late AppState appState;

  Future<String> getData() async {
    Map<String, String> headers = {
      "x-access-token": appState.token,
      "Cookie": "is_migrated=true",
      "Content-type": "Application/json"
    };
    var res = await CallApi().getData("settings/user-details", headers);
    response = json.decode(res.body);
    // debugPrint(res.statusCode.toString());
    //debugPrint(response["data"]["elasticResponse"]["response"]["data"]["line"]["datasets"][0]["data"][0].toString());
    return "Done";
  }

  String getValue(String key) {
    List arr = response["data"]["userDetails"]["attributes"];
    int length = arr.length;
    for (int i = 0; i < length; i++) {
      if (arr[i]["Name"] == key) {
        return arr[i]["Value"];
      }
    }

    return "N/A";
  }

  @override
  Widget build(BuildContext context) {
    appState = context.watch<AppState>();
    return FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapShot) {
          if (snapShot.hasData) {
            return Container(
              width: 300,
              height: 400,
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Profile",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                      const Text("UserName",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      const SizedBox(height: 10),
                      Container(
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(response["data"]["userDetails"]
                                  ["username"]
                              .toString()),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("E-mail",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      const SizedBox(height: 10),
                      Container(
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(getValue("email")),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("PhoneNumber",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      const SizedBox(height: 10),
                      Container(
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(getValue("Phonenumber")),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () =>
                              {appState.setPage(const Placeholder())},
                          child: Text("Reset Password")),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
                width: 50, height: 50, child: CircularProgressIndicator());
          }
        });
  }
}
