import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/edamam_model.dart';

class EdamamService extends ChangeNotifier{

  final String _urlBase = 'api.edamam.com';
  final String _appKey = 'b0bdf228a161dda70fb060547b0c9afc';
  final String _appId = 'b9d8e209';
  List<Receta> recetas = [];
  List<Receta> recetasFavoritas = [];
  bool estaCargando = false;
  bool noHayRecetas = false;

  bool esVegano = false;
  bool esVegetariano = false;
  bool esPaleo = false;
  bool esSinLactosa = false;
  bool esBajoEnAzucar = false;
  bool sinNueces = false;
  bool esSinTrigo = false;
  bool sinMaricos = false;
  late String _restricciones;
  List todasLasRestricciones = [];

  EdamamService(){
    getService('salad');
  }

  getService(termino) async{
    estaCargando = true;
    notifyListeners();
    final url;
    if(todasLasRestricciones.isEmpty){
      url = Uri.https(_urlBase, '/api/recipes/v2/', {
        'q':termino,
        'app_id': _appId,
        'app_key': _appKey,
        'type' : 'public',
      });
    } else {
      url = Uri.https(_urlBase, '/api/recipes/v2/', {
        'q':termino,
        'app_id': _appId,
        'app_key': _appKey,
        'type' : 'public',
        'health': _restricciones,
      });
    }


    recetas = [];
    final http.Response respuesta;
    try{
      respuesta = await http.get(url).timeout(const Duration(seconds: 7));
      if(respuesta.statusCode ==200){
        noHayRecetas = false;

        Map json = jsonDecode(respuesta.body);

        json['hits'].forEach((e) {
          Receta receta = Receta(
            url: e['recipe']['url'],
            image: e['recipe']['image'],
            source: e['recipe']['source'],
            label: e['recipe']['label'],
            calories: e['recipe']['calories'].toString(),
            totalTime: e['recipe']['totalTime'].toString(),
            ingredientes: e['recipe']['ingredientLines'],
          );
          recetas.add(receta);
        });
        noHayRecetas = false;
        estaCargando = false;
        notifyListeners();


      } else {
        noHayRecetas = true;
        notifyListeners();
      }
    } on TimeoutException catch (e){
        print('TIMEOUT');
        noHayRecetas = true;
        notifyListeners();
    } on Error catch(e){
        print('error $e');
        noHayRecetas = true;
        notifyListeners();
    }


  }

  agregarAFavoritos(Receta receta){
    receta.favorito = true;
    recetasFavoritas.add(receta);
    notifyListeners();
  }

  quitarDeFavoritos(Receta receta){
    receta.favorito = false;
    recetasFavoritas.removeWhere((item) => item.label == receta.label);
    notifyListeners();
  }

  actualizarRestricciones(){
    _restricciones = todasLasRestricciones.join("&");
    print(_restricciones);
  }


}