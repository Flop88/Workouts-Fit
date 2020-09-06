import 'package:flutter/material.dart';
import 'package:max_fit/screens/auth.dart';
import 'package:max_fit/screens/home.dart';

class LandingPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = true;
    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
