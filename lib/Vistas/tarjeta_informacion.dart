import 'package:app_turismo/Vistas/Botones/btn_icono_indicaciones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Informacion/informacion.dart';

class TarjetaInformacion extends StatefulWidget {
  final String nombreLugar;
  final String direccionLugar;
  final double puntuacion;
  final int reviews;
  final String estado;
  final int distanciaMetros;
  final int distanciaTiempo;
  final Color fondo;
  final Color bordes;
  final bool botonIndicaciones;
  final bool btnAgregarRuta;
  final bool mostrarIconosInfo;
  const TarjetaInformacion(
      {super.key,
      required this.nombreLugar,
      required this.direccionLugar,
      required this.puntuacion,
      required this.reviews,
      required this.estado,
      required this.distanciaMetros,
      required this.distanciaTiempo,
      required this.fondo,
      required this.bordes,
      required this.botonIndicaciones,
      required this.btnAgregarRuta,
      required this.mostrarIconosInfo});

  @override
  State<StatefulWidget> createState() => _TarjetaInformacion();
}

class _TarjetaInformacion extends State<TarjetaInformacion> {
  @override
  Widget build(BuildContext context) {
    final String nombreLugar = widget.nombreLugar;
    final String direccionLugar = widget.direccionLugar;
    final double puntuacion = widget.puntuacion;
    final int reviews = widget.reviews;
    final String estado = widget.estado;
    final int distanciaMetros = widget.distanciaMetros;
    final int distanciaTiempo = widget.distanciaTiempo;
    final Color fondo = widget.fondo;
    final Color bordes = widget.bordes;
    final bool botonIndicaciones = widget.botonIndicaciones;
    final bool agregarRuta = widget.btnAgregarRuta;
    final bool mostrarIconosInfo = widget.mostrarIconosInfo;

//****************************************************** Mostrar u Ocultar Partes ****************************************************** */
    //Mostrar/Ocultar boton de Icono de Indicaciones
    bool visibilityIconoIndicaciones = true;
    if (botonIndicaciones == true) {
      visibilityIconoIndicaciones = true;
    } else {
      visibilityIconoIndicaciones = false;
    }

    //Mostrar/Ocultar boton de Argegar a Ruta y separador gris
    bool visibilityBtnAgregarRuta = true;
    if (agregarRuta == true) {
      visibilityBtnAgregarRuta = true;
    } else {
      visibilityBtnAgregarRuta = false;
    }

    //Mostrar/Ocultar boton de Argegar a Ruta y separador gris
    bool visibilityInfo = true;
    if (mostrarIconosInfo == true) {
      visibilityInfo = true;
    } else {
      visibilityInfo = false;
    }

//****************************************************** Fin Mostrar u Ocultar Partes ****************************************************** */

    //Cambio de color dependiendo si el destino está abierto o cerrado
    Color abierto;
    if (estado == 'Abierto') {
      abierto = const Color(0xFF01B763);
    } else {
      abierto = const Color(0xFFF75555);
    }

    //Convertir metros a km. si pasan los 1000 metros
    double distancia;
    String distanciaLetras = '';
    String km = ' mts.';
    if (distanciaMetros >= 1000) {
      distancia = distanciaMetros / 1000;
      distancia = double.parse((distancia).toStringAsFixed(1));
      distanciaLetras = distancia.toString();
      km = ' kms.';
    } else {
      distanciaLetras = distanciaMetros.toString();
    }

    //Convertir minutos a hotas si pasa de 60 minutos
    double hora;
    String horaLetras = '';
    String min = ' min';
    if (distanciaTiempo >= 60) {
      hora = distanciaTiempo / 60;
      hora = double.parse((hora).toStringAsFixed(1));
      horaLetras = hora.toString();
      min = ' h';
    } else {
      horaLetras = distanciaTiempo.toString();
    }

    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 0),
      decoration: BoxDecoration(
        color: fondo,
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        border: Border.all(
          color: bordes,
        ),
      ),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                //Nombre del lugar y direccion
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nombreLugar,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        direccionLugar,
                        style: const TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),

                //Separador entre (nombre del lugar y direccion) y el boton de navegacion
                const SizedBox(width: 10),

                InkWell(
                  child: visibilityIconoIndicaciones
                      ? const BtnIconoIndicaciones()
                      : Container(),
                ),
              ],
            ),

            //Row que contiene numeros, estrellas y cantidad de reviews,
            Container(
              margin: const EdgeInsets.only(bottom: 5, top: 2),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Text(
                      puntuacion.toString(),
                      style: const TextStyle(
                          color: Color(0xFF616161),
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ),

                  //Separador entre numero y estrellas
                  const SizedBox(
                    width: 10,
                  ),

                  //Estrellas
                  RatingBarIndicator(
                    rating: puntuacion,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFF981F),
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    direction: Axis.horizontal,
                  ),

                  //Separador entre numero y estrellas y review
                  const SizedBox(
                    width: 10,
                  ),

                  //Row de reviews
                  Row(
                    children: [
                      const Text(
                        '( ',
                        style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        reviews.toString(),
                        style: const TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 13,
                        ),
                      ),
                      const Text(
                        ' reviews)',
                        style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Row de Estado, distancia y tiempo
            Row(
              children: [
                //Container que avisa si el sitio está abierto o cerrado
                Container(
                  margin: const EdgeInsets.only(left: 0, right: 5),
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 8,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    color: abierto,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    estado,
                    style: const TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ),

                //Separador entre estado y distancia
                const SizedBox(
                  width: 5,
                ),

                //Row de distancia
                Row(
                  children: [
                    //Icono de distancia
                    const Icon(
                      Icons.location_on_rounded,
                      size: 18,
                      color: Color(0xFF616161),
                    ),

                    //Separador entre el icono y el texto
                    const SizedBox(
                      width: 3,
                    ),

                    //Texto de distancia
                    Text(
                      distanciaLetras + km,
                      style: const TextStyle(
                        color: Color(0xFF616161),
                        fontSize: 13,
                      ),
                    )
                  ],
                ),

                //Separador entre distancia y tiempo
                const SizedBox(
                  width: 10,
                ),

                //Row de tiempo
                Row(
                  children: [
                    //Icono de tiempo
                    const Icon(
                      Icons.directions_car_rounded,
                      size: 18,
                      color: Color(0xFF616161),
                    ),

                    //Separador entre el icono y el texto de tiempo
                    const SizedBox(
                      width: 5,
                    ),

                    //Texto de tiempo
                    Text(
                      horaLetras + min,
                      style: const TextStyle(
                        color: Color(0xFF616161),
                        fontSize: 13,
                      ),
                    )
                  ],
                )
              ],
            ),

            //Separador gris
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),

            //Row de iconos para mostrar que ofrece el lugar y botón dem más info
            visibilityInfo
                ? Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: const [
                            //Icono informativo 1
                            Icon(
                              Icons.museum_outlined,
                              size: 18,
                              color: Color(0xFF616161),
                            ),

                            //Separador de iconos
                            SizedBox(
                              width: 3,
                            ),

                            //Icono informativo 2
                            Icon(
                              Icons.music_off_rounded,
                              size: 18,
                              color: Color(0xFF616161),
                            ),

                            //Separador de iconos
                            SizedBox(
                              width: 3,
                            ),

                            //Icono informativo 3
                            Icon(
                              Icons.nature_people_rounded,
                              size: 18,
                              color: Color(0xFF616161),
                            ),

                            //Separador de iconos
                            SizedBox(
                              width: 3,
                            ),

                            //Icono informativo 4
                            Icon(
                              Icons.night_shelter_outlined,
                              size: 18,
                              color: Color(0xFF616161),
                            ),

                            //Separador de iconos
                            SizedBox(
                              width: 3,
                            ),

                            //Icono informativo 5
                            Icon(
                              Icons.no_crash_rounded,
                              size: 18,
                              color: Color(0xFF616161),
                            ),

                            //Separador de iconos
                            SizedBox(
                              width: 3,
                            ),

                            //Icono informativo 6
                            Icon(
                              Icons.no_cell_rounded,
                              size: 18,
                              color: Color(0xFF616161),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const Informacion()),
                          );
                        },
                        child: Row(
                          children: const [
                            //Texto de info
                            Text(
                              'Info',
                              style: TextStyle(
                                color: Color(0xFF01924F),
                              ),
                            ),

                            //Icono de info
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Color(0xFF01924F),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),

            visibilityBtnAgregarRuta
                ? //Separador gris
                const Divider(
                    color: Color(0xFFEEEEEE),
                    thickness: 2,
                  )
                : Container(),

            visibilityBtnAgregarRuta
                ? //Separador gris
                Container(
                    margin: const EdgeInsets.only(
                        left: 0, right: 0, top: 0, bottom: 0),
                    padding: const EdgeInsets.only(
                        left: 90, right: 90, top: 15, bottom: 15),
                    decoration: const BoxDecoration(
                      color: Color(0xFF01924F),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),

                    //Texto del boton "Agregar a la ruta"
                    child: Container(
                      margin: const EdgeInsets.only(left: 0, right: 0),
                      child: const Text(
                        'Agregar a la ruta',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
