// ignore_for_file: library_private_types_in_public_api

import 'package:app_turismo/Vistas/Informacion/informacion.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  _QRScanner createState() => _QRScanner();
}

class _QRScanner extends State<QRScanner> {
  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String result = "";
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _onQRViewCreated(QRViewController controller) {
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) {
        setState(() {
          result = scanData.code!;
        });
      });
    }

    return Stack(
      children: [
        Center(
          child: QRView(
            key: qrkey,
            onQRViewCreated: _onQRViewCreated,
          ),
        ),

        //Icono de retroceso sobre imagen,
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Informacion()),
            );
          },
          child: Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 50, right: 110, left: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
              child: const Icon(
                Icons.arrow_back,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
