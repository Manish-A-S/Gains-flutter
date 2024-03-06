import 'package:flutter/material.dart';
import 'package:gains_app/Login-Signup/landing.dart';

late double width;

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "G",
              style: TextStyle(color: Colors.black, fontSize: width / 6),
            ),
            Text(
              "A",
              style: TextStyle(
                  color: const Color(0xFFEEB16F), fontSize: width / 6),
            ),
            Text(
              "I",
              style: TextStyle(
                  color: const Color(0xFFEEB16F), fontSize: width / 6),
            ),
            Text(
              "N",
              style: TextStyle(color: Colors.black, fontSize: width / 6),
            ),
            Text(
              "S",
              style: TextStyle(color: Colors.black, fontSize: width / 6),
            ),
          ],
        ));
  }
}
