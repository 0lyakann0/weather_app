import 'package:flutter/material.dart';
import 'package:weather_app/home_screen/home_screen.dart';
import 'package:weather_app/weather_screen/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  HomeScreen(),
    );
  }
}

