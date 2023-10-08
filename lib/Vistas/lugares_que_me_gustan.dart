import 'package:app_turismo/Vistas/tarjeta_informacion.dart';
import 'package:app_turismo/perfil.dart';
import 'package:flutter/material.dart';

class MisLugares extends StatefulWidget {
  const MisLugares({super.key});

  @override
  State<StatefulWidget> createState() => _MisLugares();
}

class _MisLugares extends State<MisLugares> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //Boton de retroceso
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Cuenta()));
          },
        ),
        title: const Text(
          'Mis Lugares',
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 00),
              decoration: const BoxDecoration(color: Colors.white),
              child: const TarjetaInformacion(
                nombreLugar: 'Plaza Boquerón',
                direccionLugar: 'Ever Dario Soto',
                puntuacion: 4.7,
                reviews: 200,
                estado: 'Abierto',
                distanciaMetros: 1500,
                distanciaTiempo: 500,
                fondo: Color(0xFFFAFAFA),
                bordes: Color(0xFFEEEEEE),
                botonIndicaciones: true,
                btnAgregarRuta: true,
                mostrarIconosInfo: true,
              ),
            ),

            //Separador
            const SizedBox(
              height: 10,
            ),

            Container(
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 0),
              decoration: const BoxDecoration(color: Colors.white),
              child: const TarjetaInformacion(
                nombreLugar: 'Plaza Mcal. Estigarribia',
                direccionLugar: 'Ever Dario Soto',
                puntuacion: 4.7,
                reviews: 250,
                estado: 'Cerrado',
                distanciaMetros: 50,
                distanciaTiempo: 5,
                fondo: Color(0xFFFAFAFA),
                bordes: Color(0xFFEEEEEE),
                botonIndicaciones: true,
                btnAgregarRuta: true,
                mostrarIconosInfo: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
