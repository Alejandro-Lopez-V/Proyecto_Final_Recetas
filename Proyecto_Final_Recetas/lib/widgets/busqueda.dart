import 'package:flutter/material.dart';
import 'package:about_me/services/edamam_services.dart';
import 'package:provider/provider.dart';

class BarraBuscar extends StatefulWidget {
  BarraBuscar({Key? key}) : super(key: key);

  @override
  State<BarraBuscar> createState() => _BarraBuscarState();
}

class _BarraBuscarState extends State<BarraBuscar> {
  String textoIntroducido = '';

  final _textoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final edamamServices = Provider.of<EdamamService>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(

        children: [

          TextField(
            controller: _textoController,
            decoration: InputDecoration(
                hintText: '¿Que se te antoja comer?',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: (){
                    _textoController.clear();
                  },
                  icon: const Icon(Icons.clear),
                )
            ),
          ),

          MaterialButton(
            onPressed: (){
              setState(() {
                edamamServices.getService(_textoController.text);
              });
            },
            color: Theme.of(context).primaryColor,
            child: const Text('Buscar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
