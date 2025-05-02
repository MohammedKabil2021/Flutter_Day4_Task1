import 'package:flutter/material.dart';
import 'package:flutter_day4_task1/views/main_screen2.dart';
import 'package:flutter_day4_task1/views/landing_screen1.dart';
// import 'package:flutter_application_4/screens/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => LandingScreen1(),
        "/home": (context) => MainScreen2(),
      },
    );
  }
}
