import 'package:aara_task/screens/home_screen.dart';
import 'package:aara_task/screens/landing_page.dart';
import 'package:aara_task/screens/otp_login.dart';
import 'package:aara_task/screens/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
