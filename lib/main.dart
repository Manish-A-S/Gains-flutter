import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gains/Login-Signup/landing.dart';
import 'package:gains/Splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.orange,
      scaffoldBackgroundColor: Colors.orange[100],
      textTheme: GoogleFonts.robotoTextTheme(),
    ),
    home: AnimatedSplashScreen(
      nextScreen: Landing(),
      splash: Splash(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: Duration(seconds: 3),
      duration: 100,
    ),
    routes: {
      // "/": (context) => Landing(),
      "/splash": (context) => Splash(),
    },
  ));
}
