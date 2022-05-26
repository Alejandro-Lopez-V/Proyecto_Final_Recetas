import 'package:flutter/material.dart';

class MostrarReceta extends StatelessWidget {
  final String titulo;
  final String calorias;
  final String tiempo;
  final String imagen;
  final String source;
  MostrarReceta({
    required this.titulo,
    required this.tiempo,
    required this.calorias,
    required this.imagen,
    required this.source,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){print('receta presionado');},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(imagen),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [


            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 7),
                        Text(source),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: RawMaterialButton(
                      onPressed: (){print('favorito presionado');},
                      elevation: 2.0,
                      fillColor: Colors.black45,
                      child: Icon(
                        Icons.star_border,
                        size: 45,
                        color: Colors.white,
                      ),
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              ),
              alignment: Alignment.topRight,
            ),











            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 19,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.whatshot_rounded,
                          color: Colors.purpleAccent,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text('calorias: ${double.parse(calorias).round()}'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.purpleAccent,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(tiempo),
                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }
}