import 'package:flutter/material.dart';
import 'buscar.dart';
import 'favoritos.dart';
import 'restricciones.dart';

class MiApp extends StatefulWidget {
  const MiApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MiApp> createState() => _MiAppState();
}

class _MiAppState extends State<MiApp> {

  int indiceActual = 0;

  final pantallas = [
    const Buscar(),
    const Favoritos(),
    const Restricciones(),
  ];

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        body: pantallas[indiceActual],

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          iconSize: 35,
          selectedFontSize: 20,
          unselectedFontSize: 15,
          currentIndex: indiceActual,
          onTap: (indice) => setState(() {
            (indiceActual = indice);
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoritos',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.cancel),
              label: 'Restricciones',
            ),

          ],
        ),

      );

    }


}



