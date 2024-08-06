import 'package:animator_app/views/DetailPage.dart';
import 'package:animator_app/views/HomePage.dart';
import 'package:animator_app/views/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => splashscreen(),
        'home_page': (context) => HomePage(),
        'detail_page': (context) => DetailPage(),
      },
    );
  }
}
