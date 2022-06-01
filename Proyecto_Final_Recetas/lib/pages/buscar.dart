import 'package:flutter/material.dart';
import 'package:about_me/services/edamam_services.dart';
import 'package:provider/provider.dart';
import '../models/mostrar_receta.dart';
import '../widgets/busqueda.dart';

class Buscar extends StatefulWidget {
  const Buscar({Key? key}) : super(key: key);

  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {


  @override
  Widget build(BuildContext context) {

    final edamamServices = Provider.of<EdamamService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recetas', style: TextStyle(fontSize: 25),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: edamamServices.estaCargando ?
            Column(
              children: [
                const BarraBuscar(),
                edamamServices.noHayRecetas ?
                Text('No hay recetas con ese nombre y restricciones :(', textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor), )
                    :
                const Center(child: CircularProgressIndicator(),),
              ],
            )
          :

      Column(
        children: [
          const BarraBuscar(),

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
