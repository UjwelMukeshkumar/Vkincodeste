// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vkin/Controller/splashcontroller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/splash.jpg',height: 200,width: 200,),),
    );
  }
}
