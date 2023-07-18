import "dart:convert";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:text_input/pages/chart_test.dart";
import '../api/api.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final pink = const Color(0xffE91D76);
  bool _isObscured = true;
  bool remeberMe = false;

  _logIn() async {
    var data = {
      "user": {"username": email.text, "password": pass.text}
    };

    var res = await CallApi().postData(data, "auth/login");

    int code = res.statusCode;
    var body = json.decode(res.body);

    if (code == 200) {
      // ignore: use_build_context_synchronously
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return const AlertDialog(
      //       content: Text("Login Successful"),
      //     );
      //   },
      // );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChartPage()),
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("Login Failed"),
          );
        },
      );
    }
  }

  void _onRememberMeChanged() {
    remeberMe = !remeberMe;

    if (remeberMe) {
      //TODO
    } else {
      //TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 56,
        width: 300,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          onPressed: () {
            _logIn();
          },
          child: const Text("SIGN IN"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello there ",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    TextSpan(
                      text: "👋",
                      style: TextStyle(fontFamily: 'EmojiOne', fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "E-mail",
              ),
              controller: email,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: _isObscured,
              decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )),
              controller: pass,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _onRememberMeChanged();
                    });
                  },
                  child: Container(
                    width: 20, // Decrease the width
                    height: 20, // Decrease the height
                    decoration: remeberMe
                        ? BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: pink,
                              width: 1.0,
                            ),
                            color: pink,
                          )
                        : BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            color: Colors.white,
                          ),
                    child: remeberMe
                        ? const Icon(
                            Icons.check,
                            size: 14,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("Remember me"),
              ],
            ),
            const SizedBox(height: 40),
            Expanded(
              child: RichText(
                text: TextSpan(
                    text: "Forgot Password?",
                    style: const TextStyle(
                      color: Color(0xffE91D76),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Placeholder()),
                        );
                      }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
