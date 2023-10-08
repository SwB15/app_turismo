// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BotonesFlotantes extends StatefulWidget {
  const BotonesFlotantes({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BotonesFlotantes createState() => _BotonesFlotantes();
}

class _BotonesFlotantes extends State<BotonesFlotantes> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Scaffold(
      //Botones Flotantes sobre el mapa,
      //Boton Flotante Lista sobre el mapa
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blueGrey.withOpacity(0.5),
            onPressed: () {
              const snackBar = SnackBar(
                content: Text('Boton lista funciona!'),
              );

              //Muestra en pantalla el SnackBar
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
              width: 52 * fem,
              height: 52 * fem,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF01B763),
                    Color(0xFF34E895),
                  ],
                  begin: FractionalOffset(1.0, 1.0),
                  end: FractionalOffset(0.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(CupertinoIcons.list_bullet, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),

          //Boton Flotante Ruta sobre el mapa
          FloatingActionButton(
            backgroundColor: Colors.blueGrey.withOpacity(0.5),
            onPressed: () {
              const snackBar = SnackBar(
                content: Text('Boton lista funciona!'),
              );

              //Muestra en pantalla el SnackBar
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },

            //Se mete dentro de un Container para poder usar el BoxDecoration
            child: Container(
              width: 52 * fem,
              height: 52 * fem,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF01B763),
                    Color(0xFF34E895),
                  ],
                  begin: FractionalOffset(1.0, 1.0),
                  end: FractionalOffset(0.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
                shape: BoxShape.circle,
              ),

              //Icono del boton
              child: const Icon(Icons.route_rounded, color: Colors.white),
            ),
          ),

          //Boton Flotante Ruta sobre el mapa
          FloatingActionButton(
            backgroundColor: Colors.blueGrey.withOpacity(0.5),
            onPressed: () {
              const snackBar = SnackBar(
                content: Text('Boton lista funciona!'),
              );

              //Muestra en pantalla el SnackBar
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },

            //Se mete dentro de un Container para poder usar el BoxDecoration
            child: Container(
              width: 52 * fem,
              height: 52 * fem,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF01B763),
                    Color(0xFF34E895),
                  ],
                  begin: FractionalOffset(1.0, 1.0),
                  end: FractionalOffset(0.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
                shape: BoxShape.circle,
              ),

              //Icono del boton
              child: const Icon(Icons.gps_fixed_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
