import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: const FractionalOffset(0.5, 0.8),
                child: SvgPicture.asset(
                  "assets/images/Logo.svg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                  alignment: const FractionalOffset(0.5, 0.5),
                  child: SvgPicture.asset(
                    'assets/images/Vector.svg',
                    semanticsLabel: 'Loading SVG',
                    width: 50,
                    height: 50,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
