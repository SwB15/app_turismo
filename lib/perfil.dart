import 'package:app_turismo/Vistas/eventos.dart';
import 'package:app_turismo/Vistas/Agregar/agregar_info.dart';
import 'package:app_turismo/Vistas/acerca_de.dart';
import 'package:app_turismo/Vistas/idiomas.dart';
import 'package:app_turismo/Vistas/lugares_que_me_gustan.dart';
import 'package:app_turismo/Vistas/mis_rutas.dart';
import 'package:app_turismo/Vistas/politicas.dart';
import 'package:app_turismo/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cuenta extends StatefulWidget {
  const Cuenta({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Cuenta createState() => _Cuenta();
}

class _Cuenta extends State<Cuenta> {
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
                  .push(MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
          title: const Text(
            'Cuenta',
            style: TextStyle(color: Colors.black, fontSize: 23),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),

        //Body
        body: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              //Perfil, nombre y correo
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                child: Row(
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(30), // Image radius
                        child: Image.asset(
                          "assets/img/et.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 20, top: 10),
                          child: const Text(
                            'Fulano de Tal',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'correo@example.com',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF616161)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Separador gris
              const Divider(
                color: Color(0xFFEEEEEE),
                thickness: 2,
              ),

              //Mis rutas,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MisRutas()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.directions_car),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text('Mis rutas',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),

              //Lugares que me gustan,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MisLugares()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.heart),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text('Lugares que me gustan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),

              //Separador gris
              const Divider(
                color: Color(0xFFEEEEEE),
                thickness: 2,
              ),

              //Idioma,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Idiomas()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.language_outlined),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text('Idioma',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),

              //Politicas de privacidad,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Politicas()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.lock_outline_rounded),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text('Politicas de privacidad',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),

              //Acerca De,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AcercaDe()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline_rounded),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'Acerca De',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),

              //Cerrar Sesión,
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: const Text(
                          'Cerrar Sesión',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Agregar lugares,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const AgregarInfo()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.add),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'Agregar Lugares',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),

              //Agregar eventos,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Eventos()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.add),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'Agregar Eventos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
