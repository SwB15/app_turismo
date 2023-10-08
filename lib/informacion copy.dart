// ignore_for_file: file_names

import 'package:app_turismo/Vistas/Botones/btn_agregar_ruta.dart';
import 'package:app_turismo/Vistas/Botones/btn_indicaciones.dart';
import 'package:app_turismo/Vistas/Informacion/Texto_expandible.dart';
import 'package:app_turismo/Vistas/tarjeta_informacion.dart';
import 'package:app_turismo/main.dart';
import 'package:app_turismo/qr_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Informacion extends StatefulWidget {
  const Informacion({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Informacion createState() => _Informacion();
}

class _Informacion extends State<Informacion> {
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

            //Informacion que esta debajo de la imagen
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                children: [
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

                  //Separador gris
                  const Divider(
                    color: Color(0xFFEEEEEE),
                    thickness: 2,
                  ),

                  //Botones para obtener la direccion o agregar a la ruta
                  Row(
                    children: const [
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

                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0),
                    child: const Text(
                      'Información',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  //Texto expandible
                  const ExpandableText(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan a',
                    trimLines: 4,
                  ),

                  //Container de precio de estacionamiento y entrada
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(
                        color: const Color(0xFF616161),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        //Container de precio de estacionamiento
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: const [
                              //Texto de "Estacionamiento"
                              Expanded(
                                child: Text(
                                  'Estacionamiento',
                                  style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              //Texto del monto
                              Text(
                                '25.000/dia',
                                style: TextStyle(
                                  color: Color(0xFF212121),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Separador gris
                        const Divider(
                          color: Color(0xFF616161),
                          thickness: 2,
                        ),

                        //Container del precio de entrada
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: const [
                              //Texto de "Entrada"
                              Expanded(
                                child: Text(
                                  'Entrada',
                                  style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              //Texto de monto
                              Text(
                                '50.000/persona',
                                style: TextStyle(
                                  color: Color(0xFF212121),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Container de calendario de apertura,
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border:
                          Border.all(color: const Color(0xFF616161), width: 2),
                    ),

                    //Columna de horarios de apertura
                    child: Column(
                      children: [
                        //Row de titulo de abierto o cerrado
                        Row(
                          children: const [
                            //Icono de tiempo
                            Icon(Icons.access_time_outlined),

                            //Separador entre icono de tiempo y texto de abierto/cerrado
                            SizedBox(
                              width: 5,
                            ),

                            //Texto de abierto/cerrado
                            Expanded(
                              child: Text(
                                'Abierto',
                                style: TextStyle(
                                    color: Color(0xFF01B763),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            //Icono de drop/down - lista de horarios
                            Icon(Icons.keyboard_arrow_up_rounded),
                          ],
                        ),

                        //Separador entre dias
                        const SizedBox(
                          height: 5,
                        ),

                        //Separador gris
                        const Divider(
                          color: Color(0xFF616161),
                          thickness: 2,
                        ),

                        //Separador entre dias
                        const SizedBox(
                          height: 5,
                        ),

                        //Row de horarios de Domingo
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Domingo',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' - ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        //Separador entre dias
                        const SizedBox(
                          height: 5,
                        ),

                        //Row de horarios de Lunes
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Lunes',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' - ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        //Separador entre dias
                        const SizedBox(
                          height: 5,
                        ),

                        //Row de horarios de Martes
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Martes',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' - ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        //Separador entre dias
                        const SizedBox(
                          height: 5,
                        ),

                        //Row de horarios de Miercoles
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Miercoles',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' - ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),

                        //Separador entre dias
                        const SizedBox(
                          height: 5,
                        ),

                        //Row de horarios de Jueves
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Jueves',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' - ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),

                        //Separador entre dias
                        const SizedBox(
                          height: 5,
                        ),

                        //Row de horarios de Viernes
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Viernes',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' - ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),

                        //Separador entre dias
                        const SizedBox(
                          height: 5,
                        ),

                        //Row de horarios de Sabado
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Sábado',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' - ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '00:00',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  //Container de comodidades
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border:
                          Border.all(color: const Color(0xFF616161), width: 2),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Comodidades',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),

                        //Separador
                        const SizedBox(
                          height: 5,
                        ),

                        //Separador gris
                        const Divider(
                          color: Color(0xFF616161),
                          thickness: 2,
                        ),

                        //Row de Baños y sala de estar
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.wc_outlined,
                                    color: Color(0xFF01B763),
                                  ),

                                  //Separador
                                  SizedBox(
                                    width: 5,
                                  ),

                                  //Texto de Baños
                                  Text(
                                    'Baños',
                                    style: TextStyle(
                                      color: Color(0xFF424242),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Sala de estar
                            Expanded(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.wc_outlined,
                                    color: Color(0xFF01B763),
                                  ),

                                  //Separador
                                  SizedBox(
                                    width: 5,
                                  ),

                                  //Texto de Sala de estar
                                  Text(
                                    'Sala de Estar',
                                    style: TextStyle(
                                      color: Color(0xFF424242),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        //Separador entre Rows
                        const SizedBox(
                          height: 5,
                        ),

                        //Row de restaurantes y wifi
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.fastfood,
                                    color: Color(0xFF01B763),
                                  ),

                                  //Separador
                                  SizedBox(
                                    width: 5,
                                  ),

                                  //Texto de Restaurantes
                                  Text(
                                    'Restaurante',
                                    style: TextStyle(
                                      color: Color(0xFF424242),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Wifi
                            Expanded(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.wifi,
                                    color: Color(0xFF01B763),
                                  ),

                                  //Separador
                                  SizedBox(
                                    width: 5,
                                  ),

                                  //Texto de Wifi
                                  Text(
                                    'Wifi',
                                    style: TextStyle(
                                      color: Color(0xFF424242),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.store_rounded,
                                    color: Color(0xFF01B763),
                                  ),

                                  //Separador
                                  SizedBox(
                                    width: 5,
                                  ),

                                  //Texto de Tiendas
                                  Text(
                                    'Tiendas',
                                    style: TextStyle(
                                      color: Color(0xFF424242),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Sala de estar
                            Expanded(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.museum_outlined,
                                    color: Color(0xFF01B763),
                                  ),

                                  //Separador
                                  SizedBox(
                                    width: 5,
                                  ),

                                  //Texto de Museo
                                  Text(
                                    'Museo',
                                    style: TextStyle(
                                      color: Color(0xFF424242),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.directions_car_filled_outlined,
                                    color: Color(0xFF01B763),
                                  ),

                                  //Separador
                                  SizedBox(
                                    width: 5,
                                  ),

                                  //Texto de Estacionamientos
                                  Text(
                                    'Estacionam.',
                                    style: TextStyle(
                                      color: Color(0xFF424242),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Sala de estar
                            Expanded(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.nature_people_outlined,
                                    color: Color(0xFF01B763),
                                  ),

                                  //Separador
                                  SizedBox(
                                    width: 5,
                                  ),

                                  //Texto de Naturaleza
                                  Text(
                                    'Naturaleza',
                                    style: TextStyle(
                                      color: Color(0xFF424242),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //Separador
                  const SizedBox(
                    height: 5,
                  ),

                  //Columna de Localizacion
                  Column(
                    children: [
                      //Texto de ubicacion
                      const Text(
                        'Ubicación',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),

                      //Row de icono de ubicación y direccion de ubicacion
                      Row(
                        children: const [
                          //Icono de ubicacion
                          Icon(
                            Icons.location_on_rounded,
                            color: Color(0xFF01B763),
                          ),

                          //Separador entre icono y direccion
                          SizedBox(
                            width: 5,
                          ),

                          //Texto de direccion de ubicacion
                          Text('Direccion de la ubicación')
                        ],
                      ),

                      //Separador
                      const SizedBox(
                        height: 5,
                      ),

                      //Container para la ubicacion del establecimiento en el mapa
                      Container(
                        padding: const EdgeInsets.only(
                            top: 30, bottom: 30, left: 10, right: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFF12D18E),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Separador
                  const SizedBox(
                    height: 10,
                  ),

                  Column(
                    children: [
                      //Texto de Eventos
                      const Text(
                        'Eventos',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),

                      //Separador entre texto Eventos y calendario
                      const SizedBox(
                        height: 5,
                      ),

                      //Container de calendario
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                              color: const Color(0xFFEEEEEE), width: 2),
                        ),
                        child: TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: DateTime.now(),
                        ),
                      )
                    ],
                  ),

                  //Separador
                  const SizedBox(
                    height: 10,
                  ),

                  //Separador gris
                  const Divider(
                    color: Color(0xFFF5F5F5),
                    thickness: 2,
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
