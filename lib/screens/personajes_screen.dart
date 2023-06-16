import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app_flutter/home_bloc/bloc/home_bloc.dart';
import 'package:rick_and_morty_app_flutter/models/personajes_model.dart';
import 'package:rick_and_morty_app_flutter/screens/personaje_detalle_screen.dart';

//Vista de la pagina de personajes
class PersonajesScreen extends StatefulWidget {
  const PersonajesScreen({super.key});

  @override
  State<PersonajesScreen> createState() => _PersonajesScreenState();
}

class _PersonajesScreenState extends State<PersonajesScreen> {

  @override
  Widget build(BuildContext context) {

    //double height = MediaQuery.of(context).size.height - kToolbarHeight;
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state){
          if(state is HomeLoadedState){
            PersonajesModel data = state.string;
            return ListView.builder(
              itemCount: data.results.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    final personaje = data.results[index].toJson();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PersonajesDetallesScreen(personaje: personaje)));
                  },
                  child: Column(
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
                                        data.results[index].image,
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
                                        Text(data.results[index].species.name,
                                          style: const TextStyle(
                                            fontSize: 14, color: Colors.grey
                                          ),
                                        ),
                                        Text(
                                          data.results[index].status.name,
                                          style: const TextStyle(
                                            fontSize: 14, color: Colors.grey
                                          ),
                                        ),
                                        Text(
                                          data.results[index].gender.name,
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
                    ),
                );
                } 
              )
            );
          }
          return Container();
        },
      )
    );
  }
}
