import 'dart:ui';

class Filmler{
  int id;
  String ad;
  String resim;
  int fiyat;

  Filmler({required this.id, required this.ad, required this.resim,required this.fiyat});

  factory Filmler.fromJson(Map<String, dynamic> json) {  // dynamc' den sonra yazılan json kısmına istenilen yazı yazılabilir !
    return Filmler(
        id: json["id"] as int,
        ad: json["ad"] as String,
        resim: json["resim"] as String,
        fiyat: json["fiyat"] as int
    );
  }
}