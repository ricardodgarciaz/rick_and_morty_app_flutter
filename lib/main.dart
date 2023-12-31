import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty_app_flutter/home_bloc/bloc/home_bloc.dart';


import 'package:rick_and_morty_app_flutter/screens/home_page.dart';


//INICIANDO APP
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick and Morty',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(
            title: 'Rick and Morty',
          ),
        )
      );
  }
}