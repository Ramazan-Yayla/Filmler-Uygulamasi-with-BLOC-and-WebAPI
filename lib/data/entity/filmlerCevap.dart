import 'filmler.dart';

class FilmlerCevap {
  List<Filmler> filmler;
  int success;

  FilmlerCevap({required this.filmler, required this.success});

  factory FilmlerCevap.fromJson(Map<String, dynamic> json) {  // dynamc' den sonra yazılan json kısmına istenilen yazı yazılabilir !
    var jsonArray = json["filmler"] as List;
    int success = json["success"] as int;

    var filmler = jsonArray.map((jsonArrayNesnesi) => Filmler.fromJson(jsonArrayNesnesi)).toList(); // En karmaşık ve önemli kısım burasıdır.
    // Burada KisilerCevap model dosyası içindeki jsonArray değişkeni içindeki array yapısını Kisiler model dosyasındaki nesne yapısını kullanarak her bir nesne yapısını map ile gezip List' e çevirerek kisiler değişkenine atar !
    return FilmlerCevap(filmler: filmler, success: success);
  }
}