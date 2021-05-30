import 'dart:io';

import 'package:budget_app_ui/screens/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _splash() {
    sleep(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MainScreen();
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Center(
        child: Image(
          image: AssetImage('assets/images/bitcoin.gif'),
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
