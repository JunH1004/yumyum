import 'package:flutter/material.dart';

var mainTheme = ThemeData(
    primaryColor: Colors.lightGreen,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    )
);

class MyTextStyle{
  static final h1 = TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold);
  static final h2 = TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold);
  static final h3 = TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold);
  static final h4 = TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold);
  static final b1 = TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal);
  static final b2 = TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal);
}