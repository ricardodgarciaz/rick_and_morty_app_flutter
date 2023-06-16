import 'dart:core';


import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app_flutter/models/episodios_model.dart';
import 'package:rick_and_morty_app_flutter/models/personajes_model.dart';
import 'package:rick_and_morty_app_flutter/providers/episodios_providers.dart';
import 'package:rick_and_morty_app_flutter/providers/personajes_providers.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    //evento para personajes
    on<FetchedDataEvent>((event, emit) async{
      PersonajesModel data = await PersonajeServicio.obtenerPersonajes();
      try{
        emit.call(HomeLoadedState(string: data));
      }catch (e){
        emit.call(HomeErrorState(mensaje: e.toString()));
      }
    });
    //evento para episopdios
    on<EpisodiosDataEvent>((event, emit) async{
      EpisodioModel data = await EpisodiosServicio.obtenerEpisodios();
      try{
        emit.call(EpisodiosLoadedState(data: data));
      }catch (e){
        emit.call(HomeErrorState(mensaje: e.toString()));
      }
    });


  }
}
