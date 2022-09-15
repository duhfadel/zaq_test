import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:zaq_test/dashboard/dashboard.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          backgroundColor: Colors.black,
          splash: Image.asset('assets/flutterlogo.png'),
          nextScreen: const DashboardView(),
          splashTransition: SplashTransition.rotationTransition,
          duration: 3000),
    ),
  );
}
