import 'package:app_turismo/Vistas/Mapa/Map.dart';
import 'package:flutter/material.dart';
import 'package:app_turismo/perfil.dart';

class Routes extends StatelessWidget {
  final int index;

  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const MapSample(),
      const MapSample(),
      const MapSample(),
      const MapSample(),
      const Cuenta(),
    ];
    return myList[index];
  }
}
