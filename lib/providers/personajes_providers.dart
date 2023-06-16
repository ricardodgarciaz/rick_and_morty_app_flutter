import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app_flutter/models/personajes_model.dart';



class PersonajeServicio {

  static final dio = Dio();


  static Future<PersonajesModel> obtenerPersonajes() async{
    
    final respuesta = await dio.get('https://rickandmortyapi.com/api/character');


    final res = jsonEncode(respuesta.data);


    return personajesModelFromJson(res);

  }






}