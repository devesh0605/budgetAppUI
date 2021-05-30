import 'package:budget_app_ui/screens/main_screen.dart';
import 'package:budget_app_ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budget Tracker UI',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        primaryColor: Colors.green, accentColor: Colors.blue,
        //primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
