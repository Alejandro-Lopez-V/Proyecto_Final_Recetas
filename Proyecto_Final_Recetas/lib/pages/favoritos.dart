import 'package:about_me/widgets/error_no_favoritos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/edamam_services.dart';
import '../models/mostrar_receta.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {

    final edamamServices = Provider.of<EdamamService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos', style: TextStyle(fontSize: 25),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),

      body: edamamServices.recetasFavoritas.isEmpty ?

            const NoHayFavoritos()

          :

      Column(
        children: [

          Expanded(
            child: ListView.builder(
                itemCount: edamamServices.recetasFavoritas.length,
                itemBuilder: (context,i){

                  return MostrarReceta(
                    receta: edamamServices.recetasFavoritas[i],
                  );
                }
            ),
          ),

        ],
      ),

    );
  }
}
