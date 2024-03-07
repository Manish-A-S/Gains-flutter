import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late double width;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

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
