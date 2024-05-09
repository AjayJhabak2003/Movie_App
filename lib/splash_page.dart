import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main.dart';

class Splash_page extends StatefulWidget {
  const Splash_page({Key? key}) : super(key: key);

  @override
  State<Splash_page> createState() => _Splash_pageState();
}

class _Splash_pageState extends State<Splash_page> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
  });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          alignment: Alignment.center,
          width: 130,
          height: 200,
          child: Lottie.asset('assets/animations/movie_animation.json'),


        ),
      ),

    );
  }
}
