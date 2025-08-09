import 'package:filmler_uygulamasi/data/entity/filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Filmler film;  // Aşağıda bunu kullanabilmek için ve anasayfadan gelen film' i yakalayabilmek için burada bu nesneyti oluşturmalıyız!


  DetaySayfa({required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.film.ad),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("http://kasimadalan.pe.hu/filmler_yeni/resimler/${widget.film.resim}", height: 400,width: 300),
            Text("${widget.film.fiyat} ₺", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),),
          ],
        ),
      ),
    );
  }
}
