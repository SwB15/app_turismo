// ignore_for_file: file_names

import 'package:app_turismo/Vistas/tarjeta_informacion.dart';
import 'package:flutter/material.dart';

class TarjetaFlotante extends StatefulWidget {
  const TarjetaFlotante({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TarjetaFlotante createState() => _TarjetaFlotante();
}

class _TarjetaFlotante extends State<TarjetaFlotante> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 325, bottom: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: const [
          TarjetaInformacion(
            nombreLugar: 'Plaza Boquerón',
            direccionLugar: 'Ever Dario Soto',
            puntuacion: 4.7,
            reviews: 200,
            estado: 'Abierto',
            distanciaMetros: 1500,
            distanciaTiempo: 500,
            fondo: Colors.white,
            bordes: Colors.white,
            botonIndicaciones: true,
            btnAgregarRuta: true,
            mostrarIconosInfo: true,
          ),

          //Boton para agregar a una ruta,
        ],
      ),
    );
  }
}
