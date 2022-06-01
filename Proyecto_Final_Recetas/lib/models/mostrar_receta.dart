import 'package:about_me/widgets/boton_favorito.dart';
import 'package:flutter/material.dart';
import 'edamam_model.dart';
import 'package:provider/provider.dart';
import '../services/edamam_services.dart';
import '../pages/mostrarURL.dart';

class MostrarReceta extends StatefulWidget {

  final Receta receta;

  // ignore: use_key_in_widget_constructors
  const MostrarReceta({
    required this.receta
  });

  @override
  State<MostrarReceta> createState() => _MostrarRecetaState();
}

class _MostrarRecetaState extends State<MostrarReceta> {

  
  

  @override
  Widget build(BuildContext context) {

    final edamamServices = Provider.of<EdamamService>(context);

    Future mostrarIngredientes() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(widget.receta.label, textAlign: TextAlign.center,),
          content: SizedBox(
            height: 300,
            width: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.receta.ingredientes.length,
              itemBuilder: (context,i){
                return Text('•${widget.receta.ingredientes[i].toString()}\n', textAlign: TextAlign.start,);
              },

            ),
          ),
        ),
    );

    return InkWell(
      onTap: () => setState(() {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MostrarURL(enlace: widget.receta.url),
        ));

        }),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(
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
            image: NetworkImage(widget.receta.image),
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
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 7),
                        Text(widget.receta.source),
                      ],
                    ),
                  ),


                  BotonFavorito(receta: widget.receta),

                ],
              ),
              alignment: Alignment.topRight,
            ),

            Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  widget.receta.label,
                  style: const TextStyle(
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
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.whatshot_rounded,
                          color: Colors.purpleAccent,
                          size: 18,
                        ),
                        const SizedBox(width: 7),
                        Text('calorias: ${double.parse(widget.receta.calories).round()}'),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: RawMaterialButton(
                      onPressed: (){
                        mostrarIngredientes();
                      },
                      elevation: 2.0,
                      fillColor: Colors.black45,
                      child: const Icon(
                        Icons.list_alt,
                        size: 50,
                        color: Colors.white,
                      ),
                      shape: const CircleBorder(),
                    ),
                  ),


                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: Colors.purpleAccent,
                          size: 18,
                        ),
                        const SizedBox(width: 7),
                        Text(widget.receta.totalTime),
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