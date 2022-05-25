import 'package:about_me/services/edamam_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

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
  const MiApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MiApp> createState() => _MiAppState();
}

class _MiAppState extends State<MiApp> {

  int indiceActual = 0;


  @override
  Widget build(BuildContext context) {

    final edamamServices = Provider.of<EdamamService>(context);

    if(edamamServices.recetas.isEmpty){
      return Scaffold(
        appBar: AppBar(
          title: Text('Edamam'),
          centerTitle: true,
        ),

        body: Center(child: Text('Cargando', style: TextStyle(fontSize: 40),)),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edamam'),
          centerTitle: true,
        ),

        body: ListView.builder(
            itemCount: edamamServices.recetas.length,
            itemBuilder: (context,i){
              return Center(child: Text(edamamServices.recetas[i].label.toString(),
                style: TextStyle(fontSize: 22),));
            }
        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          iconSize: 30,
          showUnselectedLabels: false,
          currentIndex: indiceActual,
          onTap: (indice) => setState(() {
            (indiceActual = indice);
          }),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Buscar',
                backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favoritos',
                backgroundColor: Colors.yellowAccent,
            ),
          ],
        ),
      );
    }


  }
}


