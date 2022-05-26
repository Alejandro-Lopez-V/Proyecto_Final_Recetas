import 'package:flutter/material.dart';
import 'package:about_me/services/edamam_services.dart';
import 'package:provider/provider.dart';
import '../models/mostrar_receta.dart';
import '../widgets/busqueda.dart';

class Buscar extends StatefulWidget {
  Buscar({Key? key}) : super(key: key);

  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {


  @override
  Widget build(BuildContext context) {

    final edamamServices = Provider.of<EdamamService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas', style: TextStyle(fontSize: 25),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: edamamServices.estaCargando ?
            Column(
              children: [
                BarraBuscar(),
                Center(child: CircularProgressIndicator(),)
              ],
            )
          :

      Column(
        children: [
          BarraBuscar(),

          Expanded(
            child: ListView.builder(
                itemCount: edamamServices.recetas.length,
                itemBuilder: (context,i){

                  return MostrarReceta(
                    receta: edamamServices.recetas[i],
                  );
                }
            ),
          ),

        ],
      )
    );
  }
}
