// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Sign_in.dart';
import 'package:flutter_application_1/todo_page.dart';
//import 'package:flutter_application_1/BMI_Page.dart';
import 'package:flutter_application_1/BM_IPAGE.dart';
//import 'Info_card.dart';
////import 'side_menu.dart';

void main() {
  //SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Sign_in(),
        '/Todo': (context) => Todo(),
        '/BMI': (context) => BMI(),
      },
      // home: Sign_in(),
    );
  }
}
