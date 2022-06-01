import 'package:flutter/material.dart';
import '../services/edamam_services.dart';
import 'package:provider/provider.dart';
import '../models/edamam_model.dart';

class BotonFavorito extends StatefulWidget {
  Receta receta;

  BotonFavorito({Key? key, required this.receta}) : super(key: key);

  @override
  State<BotonFavorito> createState() => _BotonFavoritoState();
}

class _BotonFavoritoState extends State<BotonFavorito> {
  @override
  Widget build(BuildContext context) {

    final edamamServices = Provider.of<EdamamService>(context);

    if(widget.receta.favorito == false){
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: RawMaterialButton(
          onPressed: (){
            if(widget.receta.favorito == false){
              edamamServices.agregarAFavoritos(widget.receta);
            }
            else {
              edamamServices.quitarDeFavoritos(widget.receta);
            }

          },
          elevation: 2.0,
          fillColor: Colors.black45,
          child: const Icon(
            Icons.star_border,
            size: 45,
            color: Colors.white,
          ),
          shape: const CircleBorder(),
        ),
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: RawMaterialButton(
          onPressed: (){
            if(widget.receta.favorito == false){
              edamamServices.agregarAFavoritos(widget.receta);
            }
            else {
              edamamServices.quitarDeFavoritos(widget.receta);
            }

          },
          elevation: 2.0,
          fillColor: Colors.black45,
          child: const Icon(
            Icons.star,
            size: 60,
            color: Colors.yellowAccent,
          ),
          shape: const CircleBorder(),
        ),
      );
    }
  }
}
