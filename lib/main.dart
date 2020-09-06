import 'package:flutter/material.dart';
import 'package:max_fit/screens/landing.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Fit',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(title: TextStyle(color: Colors.white))
      ),
      home: LandingPage(),
    );
  }
}
