



import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app_flutter/models/episodios_model.dart';

class EpisodiosServicio {

  static final dio = Dio();


  static Future<EpisodioModel> obtenerEpisodios()async{

    final respuesta = await dio.get('https://rickandmortyapi.com/api/episode');



    final res = jsonEncode(respuesta.data);



    return episodioModelFromJson(res);

  }


}