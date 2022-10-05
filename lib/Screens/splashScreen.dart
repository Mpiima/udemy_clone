import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'LandingPage/landingPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: LandingPage(),
                      type: PageTransitionType.bottomToTop))
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
              width: double.infinity,
              child:
                  SizedBox(height: 300, child: Image.asset('images/logo.png'))),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Colors.blue[200],
                backgroundColor: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
