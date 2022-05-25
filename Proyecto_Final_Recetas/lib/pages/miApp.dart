import 'package:about_me/services/edamam_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'buscar.dart';
import 'favoritos.dart';

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
      child: MiApp(),
    );
  }
}


class MiApp extends StatefulWidget {
  MiApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MiApp> createState() => _MiAppState();
}

class _MiAppState extends State<MiApp> {

  int indiceActual = 0;

  final pantallas = [
    Buscar(),
    Favoritos(),
  ];

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        body: pantallas[indiceActual],

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          iconSize: 40,
          selectedFontSize: 20,
          unselectedFontSize: 15,
          currentIndex: indiceActual,
          onTap: (indice) => setState(() {
            (indiceActual = indice);
          }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoritos',
            ),
          ],
        ),

      );

    }


}



