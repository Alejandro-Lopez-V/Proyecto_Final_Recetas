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
  bool estaCargando = false;

  EdamamService(){
    getService('healthy');
  }

  getService(termino) async{
    estaCargando = true;
    notifyListeners();
    final url = Uri.https(_urlBase, '/api/recipes/v2/', {
      'q':termino,
      'app_id': _appId,
      'app_key': _appKey,
      'type' : 'public',
    });
    recetas = [];

    final respuesta = await http.get(url);
    Map json = jsonDecode(respuesta.body);
    json['hits'].forEach((e) {
      Receta receta = Receta(
        url: e['recipe']['url'],
        image: e['recipe']['image'],
        source: e['recipe']['source'],
        label: e['recipe']['label'],
        calories: e['recipe']['calories'].toString(),
        totalTime: e['recipe']['totalTime'].toString(),
      );
      recetas.add(receta);
    });
    estaCargando = false;
    notifyListeners();
  }

}