import 'package:filmler_uygulamasi/data/entity/filmler.dart';
import 'package:filmler_uygulamasi/ui/cubit/anasayfa_cubit.dart';
import 'package:filmler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa>{

  @override
  void initState() {
    super.initState();

    context.read<AnaSayfaCubit>().filmleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filmler"),),
      body: BlocBuilder<AnaSayfaCubit, List<Filmler>>(   //Yukarda oluşturduğumuz future metodunu kullanabilmke için bu metodu yazmamız gerekir !
        builder: (context,filmlerListesi){
          if(filmlerListesi.isNotEmpty){
            return GridView.builder(
              itemCount: filmlerListesi.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2 , childAspectRatio: 1 / 1.8  // Burada 1 satırda kaç card gösterildiğini ve her bir cardın genişlik/yukseklık ile oranını belirleriz. Yani burda genişliği 1 ise yüksekliğini genişliğin 1.8 katı olacak şekilde ayarlar !
              ),
              itemBuilder: (context, filmIndeks){
                var film = filmlerListesi[filmIndeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film)))
                    .then((value) => context.read<AnaSayfaCubit>().filmleriYukle());
                  },
                  child: Card(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network("http://kasimadalan.pe.hu/filmler_yeni/resimler/${film.resim}"),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2.5),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${film.fiyat} ₺", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                ElevatedButton(onPressed: (){
                                  print("${film.ad} sepete eklendi.");
                                }, child: const Text("Sepete Ekle")),
                              ],
                            ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      )
    );
  }
}
