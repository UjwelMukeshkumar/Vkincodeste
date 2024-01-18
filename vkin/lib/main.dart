import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vkin/view/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 123, 68, 219)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
