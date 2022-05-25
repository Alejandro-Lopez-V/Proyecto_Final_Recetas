import 'package:flutter/material.dart';
import 'pages/miApp.dart';

void main() => runApp(const AboutMeApp());

class AboutMeApp extends StatelessWidget {
  const AboutMeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Color(0xFF161616),
        primarySwatch: Colors.blue,
      ),

      home: AppState(),

    );
  }
}




