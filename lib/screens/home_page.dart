

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app_flutter/screens/personajes_screen.dart';
import 'package:provider/provider.dart';
import '../custom_widget/cards.dart';
import '../home_bloc/bloc/home_bloc.dart';
import 'episodios_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    dynamic event = Provider.of<HomeBloc>(context, listen: false);
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Table(
                    children: [
                      TableRow(children: [
                        //tarjetas para ir a pantalla de eposidios o personajes
                        SingleCardMenu(
                          color: Colors.blue,
                          icon: Icons.person_2_outlined,
                          onTap: () {
                            event.add(FetchedDataEvent());
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PersonajesScreen(),
                            ));
                            print('Personajes');
                          },
                          text: 'Personajes',
                        ),
                        SingleCardMenu(
                          color: Colors.red,
                          icon: Icons.video_camera_back,
                          onTap: () {
                            event.add(EpisodiosDataEvent());
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EpisodiosScreen(),
                            ));
                          },
                          text: 'Episodios',
                        )
                      ])
                    ],
                  ),
                ],                
              )
           );
        },
      ),
    );
  }
}
