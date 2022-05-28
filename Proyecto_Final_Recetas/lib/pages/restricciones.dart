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
        title: Text('Restricciones', style: TextStyle(fontSize: 25),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),

      body: ListView(
        padding: EdgeInsets.all(12),
        children: [

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esVegano,
            title: Text('Vegano', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esVegano = value!;
                if(edamamServices.esVegano){
                  edamamServices.todasLasRestricciones.add('vegan');
                } else {
                  edamamServices.todasLasRestricciones..remove('vegan');
                }
                edamamServices.actualizarRestricciones();

              });
            },
          ),


          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esVegetariano,
            title: Text('Vegetariano', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esVegetariano = value!;
                if(edamamServices.esVegetariano){
                  edamamServices.todasLasRestricciones.add('vegetarian');
                } else {
                  edamamServices.todasLasRestricciones..remove('vegetarian');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),


          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esSinLactosa,
            title: Text('Sin Lactosa', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esSinLactosa = value!;
                if(edamamServices.esSinLactosa){
                  edamamServices.todasLasRestricciones.add('dairy-free');
                } else {
                  edamamServices.todasLasRestricciones..remove('dairy-free');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esBajoEnAzucar,
            title: Text('Bajo en Azúcar', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esBajoEnAzucar = value!;
                if(edamamServices.esBajoEnAzucar){
                  edamamServices.todasLasRestricciones.add('low-sugar');
                } else {
                  edamamServices.todasLasRestricciones..remove('low-sugar');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
            value: edamamServices.esSinTrigo,
            title: Text('Sin Trigo', style: TextStyle(fontSize: 30),),
            onChanged: (value) {
              setState(() {
                edamamServices.esSinTrigo = value!;
                if(edamamServices.esSinTrigo){
                  edamamServices.todasLasRestricciones.add('wheat-free');
                } else {
                  edamamServices.todasLasRestricciones..remove('wheat-free');
                }
                edamamServices.actualizarRestricciones();
              });
            },
          ),


          Container(
            padding: EdgeInsets.fromLTRB(70, 60, 30, 10),
            child: Text('Calorias',style: TextStyle(
                fontSize: 30, color: Theme.of(context).primaryColor),),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _textoController,
              onChanged: (e){
                print(e);
              },
              decoration: InputDecoration(
                hintText: 'Introducir calorias máximas',
                border: OutlineInputBorder(),
              ),
            ),
          ),











        ],
      ),
    );
  }
}
