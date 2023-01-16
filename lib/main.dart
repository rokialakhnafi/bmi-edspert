import 'package:flutter/material.dart';
import 'package:latihanproyek/views/bmidatascreen.dart';
import 'constant/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
        ),
       
        primarySwatch: Colors.blue,
      ),
      home: const BMIDataScreen()
    );
  }
}