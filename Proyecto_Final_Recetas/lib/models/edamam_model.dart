class Receta{
  String url;
  String image;
  String source;
  String label;
  String calories;
  String totalTime;
  bool favorito = false;
  List<dynamic> ingredientes;

  Receta({required this.url,required this.image,required this.source,required this.label,required this.calories,required this.totalTime, required this.ingredientes
  });

  factory Receta.fromJson(Map<String, dynamic> json){
    List<Receta> recetas = [];
    return Receta(
      url: json['url'],
      image: json['image'],
      source: json['source'],
      label: json['label'],
      calories: json['calories'],
      ingredientes: json['ingredientLines'],
      totalTime: json['totalTime'],
    );
  }

}
