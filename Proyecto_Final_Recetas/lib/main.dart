import 'package:about_me/services/edamam_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/miApp.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EdamamService(), lazy: false,
        ),
      ],
      child: EdamamApp(),
    );
  }
}

class EdamamApp extends StatelessWidget {
  const EdamamApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Color(0xFF161616),
        backgroundColor: Color(0xFFBBBBBB),
        scaffoldBackgroundColor: Color(0xFFBBBBBB),
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),

      ),

      home: MiApp(),

    );
  }
}




