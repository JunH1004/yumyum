import 'package:flutter/material.dart';
import 'package:yumyum_flutter/my_style.dart';
import 'package:yumyum_flutter/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainTheme, //mainTheme - my_style.dart
      home: HomePage(),
    );
  }
}
