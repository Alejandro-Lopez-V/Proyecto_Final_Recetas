class Receta{
  String? url;
  String? image;
  String? source;
  String? label;
  String? calories;

  Receta({this.url, this.image, this.source, this.label, this.calories});

  factory Receta.fromJson(Map<String, dynamic> json){
    List<Receta> recetas = [];
    return Receta(
      url: json['url'],
      image: json['image'],
      source: json['source'],
      label: json['label'],
      calories: json['calories']
    );
  }

}
