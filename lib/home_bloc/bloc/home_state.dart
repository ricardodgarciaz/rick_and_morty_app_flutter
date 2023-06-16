// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


class EpisodiosLoadedState extends HomeState{

  EpisodioModel data;
  EpisodiosLoadedState({required this.data});

}

class HomeLoadedState extends HomeState{

  PersonajesModel string;
  HomeLoadedState({required this.string});
}



class HomeErrorState extends HomeState{
  String mensaje;
  HomeErrorState({required this.mensaje});
}
