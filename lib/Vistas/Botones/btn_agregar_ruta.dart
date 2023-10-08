import 'package:flutter/material.dart';

class BtnAgregarRuta extends StatefulWidget {
  //Variables para el padding
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;

  //Variables para el margin
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final double marginBottom;

  const BtnAgregarRuta({
    super.key,
    required this.paddingLeft,
    required this.paddingRight,
    required this.paddingTop,
    required this.paddingBottom,
    required this.marginLeft,
    required this.marginRight,
    required this.marginTop,
    required this.marginBottom,
  });

  @override
  State<BtnAgregarRuta> createState() => _BtnAgregarRutaState();
}

class _BtnAgregarRutaState extends State<BtnAgregarRuta> {
  @override
  Widget build(BuildContext context) {
    //Variables para el padding
    final double paddingLeft = widget.paddingLeft;
    final double paddingRight = widget.paddingRight;
    final double paddingTop = widget.paddingTop;
    final double paddingBottom = widget.paddingBottom;

    //Variables para el margin
    final double marginLeft = widget.marginLeft;
    final double marginRight = widget.marginRight;
    final double marginTop = widget.marginTop;
    final double marginBottom = widget.marginBottom;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
            left: marginLeft,
            right: marginRight,
            top: marginTop,
            bottom: marginBottom),
        padding: EdgeInsets.only(
            left: paddingLeft,
            right: paddingRight,
            top: paddingTop,
            bottom: paddingBottom),
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
      ),
    );
  }
}
