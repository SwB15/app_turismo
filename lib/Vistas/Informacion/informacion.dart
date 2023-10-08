import 'package:app_turismo/Vistas/Botones/btn_agregar_ruta.dart';
import 'package:app_turismo/Vistas/Botones/btn_indicaciones.dart';
import 'package:app_turismo/Vistas/Informacion/info.dart';
import 'package:app_turismo/Vistas/Informacion/reviews.dart';
import 'package:app_turismo/Vistas/tarjeta_informacion.dart';
import 'package:app_turismo/main.dart';
import 'package:app_turismo/qr_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Informacion extends StatefulWidget {
  const Informacion({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Informacion createState() => _Informacion();
}

class _Informacion extends State<Informacion> {
  bool visibilityInfo = false;
  bool visibilityReviews = false;

  void _changed(bool visibility, String field) {
    field == 'info';
    setState(() {
      if (field == "info") {
        visibilityInfo = true;
        visibilityReviews = false;
      }
      if (field == "reviews") {
        visibilityInfo = false;
        visibilityReviews = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //Imagen de informacion
                Image.asset("assets/img/ruinas_jesuitas.jpg"),

                Row(
                  children: [
                    //Icono de retroceso sobre imagen,
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 50, right: 120, left: 20),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 25,
                          ),
                        ),
                      ),
                    ),

                    //Separador entre iconos flotantes sobre imagen
                    const SizedBox(
                      width: 50,
                    ),

                    //Icono flotante de favoritos
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle),
                      child: const Icon(
                        CupertinoIcons.heart,
                        size: 25,
                      ),
                    ),

                    //Icono flotante de ir a la ubicacion
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10, top: 50, right: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.share_outlined,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //Informacion que esta debajo de la imagen,
            //Tarjeta que contiene:
            //Nombre del lugar
            //Direccion del lugar
            //Row que contiene numeros, estrellas y cantidad de reviews,
            //Row de Estado, distancia y tiempo,
            const TarjetaInformacion(
              nombreLugar: 'Plaza Boquerón',
              direccionLugar: 'Ever Dario Soto',
              puntuacion: 4.7,
              reviews: 200,
              estado: 'Abierto',
              distanciaMetros: 1500,
              distanciaTiempo: 500,
              fondo: Colors.white,
              bordes: Colors.white,
              botonIndicaciones: false,
              btnAgregarRuta: false,
              mostrarIconosInfo: false,
            ),

            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      //Botones para obtener la direccion o agregar a la ruta
                      //Boton para indicaciones,
                      BtnIndicaciones(),

                      //Separador entre botones
                      SizedBox(
                        width: 10,
                      ),

                      //Boton para agregar a una ruta,
                      BtnAgregarRuta(
                        paddingLeft: 20,
                        paddingRight: 20,
                        paddingTop: 15,
                        paddingBottom: 15,
                        marginLeft: 0,
                        marginRight: 0,
                        marginTop: 10,
                        marginBottom: 10,
                      ),
                    ],
                  ),

                  //Separador gris
                  const Divider(
                    color: Color(0xFFEEEEEE),
                    thickness: 2,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Info
                      InkWell(
                        onTap: () {
                          visibilityInfo ? null : _changed(true, "info");
                        },

                        //Container de Info
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 5, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: visibilityInfo
                                    ? const Color(0xFF01B763)
                                    : const Color(0xFF9E9E9E),
                                width: visibilityInfo ? 2 : 1,
                              ),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Info",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: visibilityInfo
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                    color: visibilityInfo
                                        ? const Color(0xFF01B763)
                                        : const Color(0xFF9E9E9E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //Reviews
                      InkWell(
                        onTap: () {
                          visibilityReviews ? null : _changed(true, "reviews");
                        },
                        //Container de Reviews
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 5, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: visibilityInfo
                                    ? const Color(0xFF9E9E9E)
                                    : const Color(0xFF01B763),
                                width: visibilityInfo ? 1 : 2,
                              ),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Reviews",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: visibilityInfo
                                        ? FontWeight.w400
                                        : FontWeight.bold,
                                    color: visibilityInfo
                                        ? const Color(0xFF9E9E9E)
                                        : const Color(0xFF01B763),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      children: <Widget>[
                        visibilityInfo ? const Info() : Container(),
                        visibilityReviews
                            ? const Reviews(puntuacion: 4.5, reviews: 200)
                            : Container(),
                      ],
                    ),
                  ),

                  //Container que tiene el botón para escaneo QR y boton para ir a la ubicacion,
                  Container(
                    margin: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const QRScanner()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color(0x1412D18E),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: const Icon(
                              Icons.view_in_ar,
                              color: Color(0xFF01B763),
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        //Boton para Indicaciones,
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                              color: const Color(0xFF01924F),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(0.0, 5.0),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),

                            //Texto del boton "Indicaciones"
                            child: Container(
                              margin: const EdgeInsets.only(left: 0, right: 0),
                              child: const Text(
                                'Indicaciones',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
