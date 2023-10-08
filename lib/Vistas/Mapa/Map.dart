// ignore_for_file: file_names, prefer_collection_literals

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:app_turismo/Vistas/BottomNavigator/Bottom_navigator.dart';
import 'package:app_turismo/Vistas/Mapa/BotonesFlotantes.dart';
import 'package:app_turismo/Vistas/Mapa/buscar.dart';
import 'package:app_turismo/Vistas/Mapa/tarjetaFlotante.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Uint8List? markerIcon;
  bool mostrarTarjetaFlotante = false;
  bool mostrarBuscador = false;
  bool toque = false;
  late Uint8List icono;

  //Google Map Controller
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  //Posición inicial del mapa
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-26.812273807653455, -57.09299443829941),
    zoom: 8.7,
  );

  //Estilo de mapa sin ningún label de ningpun tipo
  Future<void> _setMapStyle(GoogleMapController controller) async {
    String style = await DefaultAssetBundle.of(context)
        .loadString('assets/style/map_style.json');
    controller.setMapStyle(style);
  }

  //Convierte una imagen de assets y lo convierte a Uint8List
  Future<Uint8List> getMarkerIcon(String image, int size) async {
    ByteData data = await rootBundle.load(image);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: size);
    ui.FrameInfo info = await codec.getNextFrame();
    return (await info.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> loadIcon() async {
    icono = await getMarkerIcon('assets/img/et.png', 130);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    loadIcon();
    return Scaffold(
      floatingActionButton: Visibility(
        visible: !mostrarTarjetaFlotante,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Boton Flotante de lista de rutas
            FloatingActionButton(
              backgroundColor: Colors.black.withOpacity(0.0),
              onPressed: () {},
              child: Container(
                width: 55 * fem,
                height: 55 * fem,
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

            //Boton flotante de ruta
            FloatingActionButton(
              backgroundColor: Colors.black.withOpacity(0.0),
              onPressed: () {},
              child: Container(
                width: 55 * fem,
                height: 55 * fem,
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

            //Boton flotante de Ubicación actual
            FloatingActionButton(
              backgroundColor: Colors.black.withOpacity(0.0),
              onPressed: () {},
              child: Container(
                width: 55 * fem,
                height: 55 * fem,
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
      ),

      //Body
      body: Stack(
        children: [
          GoogleMap(
            onTap: (position) {
              setState(() {
                mostrarTarjetaFlotante = false;
                if (!mostrarTarjetaFlotante && !toque) {
                  mostrarBuscador = false;
                  toque = true;
                } else if (!mostrarTarjetaFlotante && toque) {
                  mostrarBuscador = true;
                  toque = false;
                }
              });
            },
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            mapType: MapType.normal,
            markers: _createMarkers(),
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _setMapStyle(controller);
            },
          ),
          if (mostrarTarjetaFlotante) const TarjetaFlotante(),
          if (mostrarBuscador) const Buscar(),
          //const BNavigator(currentIndex: (i) {  },),
        ],
      ),
    );
  }

  //Agregar Marcadores al mapa
  Set<Marker> _createMarkers() {
    return <Marker>[
      Marker(
        onTap: () async {
          mostrarTarjetaFlotante = true;
          mostrarBuscador = false;
          toque = false;
          setState(() {});
        },
        icon: BitmapDescriptor.fromBytes(icono),
        markerId: const MarkerId('Marcador de prueba'),
        position: const LatLng(-26.66747115356781, -57.140256633900556),
        infoWindow:
            const InfoWindow(title: 'Lugar de prueba', snippet: 'Descripción?'),
      ),
    ].toSet();
  }
}
