import 'package:flutter/material.dart';

class NoHayFavoritos extends StatelessWidget {
  const NoHayFavoritos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150.0),
            child: Container(
              color: Theme.of(context).primaryColor,
              height: 400,

              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 60, color: Colors.white,),
                    Text('Parece que no tiene recetas favoritas',
                      style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                    SizedBox(height: 30,),
                    Text('Puede dirigirse a la pantalla de Buscar para encontrar'
                        ' una receta que le guste y agregarlo a su lista de favoritos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
