import 'package:flutter/material.dart';
import '../services/edamam_services.dart';
import 'package:provider/provider.dart';

class Restricciones extends StatefulWidget {
  const Restricciones({Key? key}) : super(key: key);

  @override
  _RestriccionesState createState() => _RestriccionesState();
}

class _RestriccionesState extends State<Restricciones> {

  final _textoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final edamamServices = Provider.of<EdamamService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restricciones', style: TextStyle(fontSize: 25),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esVegano,
            title: const Text('Vegano', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esVegano = value!;
                if(edamamServices.esVegano){
                  edamamServices.todasLasRestricciones.add('vegan');
                } else {
                  edamamServices.todasLasRestricciones.remove('vegan');
                }
                edamamServices.actualizarRestricciones();

              });
            },
          ),


          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esVegetariano,
            title: const Text('Vegetariano', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esVegetariano = value!;
                if(edamamServices.esVegetariano){
                  edamamServices.todasLasRestricciones.add('vegetarian');
                } else {
                  edamamServices.todasLasRestricciones.remove('vegetarian');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esPaleo,
            title: const Text('Paleo', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esPaleo = value!;
                if(edamamServices.esPaleo){
                  edamamServices.todasLasRestricciones.add('paleo');
                } else {
                  edamamServices.todasLasRestricciones.remove('paleo');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),


          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esSinLactosa,
            title: const Text('Sin Lactosa', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esSinLactosa = value!;
                if(edamamServices.esSinLactosa){
                  edamamServices.todasLasRestricciones.add('dairy-free');
                } else {
                  edamamServices.todasLasRestricciones.remove('dairy-free');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esBajoEnAzucar,
            title: const Text('Bajo en Azúcar', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esBajoEnAzucar = value!;
                if(edamamServices.esBajoEnAzucar){
                  edamamServices.todasLasRestricciones.add('low-sugar');
                } else {
                  edamamServices.todasLasRestricciones.remove('low-sugar');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esSinTrigo,
            title: const Text('Sin Trigo', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esSinTrigo = value!;
                if(edamamServices.esSinTrigo){
                  edamamServices.todasLasRestricciones.add('wheat-free');
                } else {
                  edamamServices.todasLasRestricciones.remove('wheat-free');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.sinMaricos,
            title: const Text('Sin Mariscos', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.sinMaricos = value!;
                if(edamamServices.sinMaricos){
                  edamamServices.todasLasRestricciones.add('shellfish-free');
                } else {
                  edamamServices.todasLasRestricciones.remove('shellfish-free');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.sinNueces,
            title: const Text('Sin Nueces', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.sinNueces = value!;
                if(edamamServices.sinNueces){
                  edamamServices.todasLasRestricciones.add('tree-nut-free');
                } else {
                  edamamServices.todasLasRestricciones.remove('tree-nut-free');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),

        ],
      ),
    );
  }
}
