import 'package:filmler_uygulamasi/data/entity/filmler.dart';
import 'package:filmler_uygulamasi/data/repo/filmlerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnaSayfaCubit extends Cubit<List<Filmler>>{
  AnaSayfaCubit():super([]);

  var frepo = FilmlerRepo();

  Future<void> filmleriYukle() async{
    var filmlerListesi = await frepo.filmleriYukle();
    emit(filmlerListesi);
  }

}