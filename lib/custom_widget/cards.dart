import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_bloc/bloc/home_bloc.dart';

//Tarjetas de pantalla HOME

class SingleCardMenu extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color colorText;
  final String text;
  final VoidCallback onTap;

  const SingleCardMenu(
      {Key? key,
      required this.icon,
      required this.color,
      this.colorText = Colors.black,
      required this.text,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: CardBackground(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Offstage(
                  offstage: size.height < 450 ? true : false,
                  child: CircleAvatar(
                    backgroundColor: color,
                    radius: 30,
                    child: Icon(
                      icon,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: colorText,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CardBackground extends StatelessWidget {
  final Widget child;

  const CardBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      child: Material(
        child: ClipRRect(
          child: InkWell(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                height:
                    size.height < 450 ? size.height * 0.18 : size.height * 0.20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
