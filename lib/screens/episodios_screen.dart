import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app_flutter/home_bloc/bloc/home_bloc.dart';
import 'package:rick_and_morty_app_flutter/models/episodios_model.dart';


//Vista de la pagina de Episodios
class EpisodiosScreen extends StatefulWidget {
  const EpisodiosScreen({super.key});

  @override
  State<EpisodiosScreen> createState() => _EpisodiosScreenState();
}

class _EpisodiosScreenState extends State<EpisodiosScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodios'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state){
          if(state is EpisodiosLoadedState){
            EpisodioModel data = state.data;
            return ListView.builder(
              itemCount: data.results.length,
              itemBuilder: ((context, index){
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Image.network(
                            'https://i.blogs.es/9b19ad/youtube/450_1000.webp',
                            width: 150,
                            height: 100,
                            fit: BoxFit.fill,
                            //color: Colors.purple,
                            colorBlendMode: BlendMode.color,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.results[index].name,
                                    style: const TextStyle(
                                      fontSize: 18, color: Colors.black
                                    ),
                                  ),
                                  Text(data.results[index].episode,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey
                                      ),
                                    ),
                                  Text(
                                      data.results[index].airDate,
                                      style: const TextStyle(
                                        fontSize: 14, color: Colors.grey
                                      ),
                                  ),
                                  Text(
                                    data.results[index].created.toString(),
                                      style: const TextStyle(
                                        fontSize: 14, color: Colors.grey
                                      ),
                                  ) 
                                ],
                            ) 
                          )
                        ],
                      )
                    ],
                );
              })
            );
 
          }
          return Container();
        }
      )
    );
  }
}