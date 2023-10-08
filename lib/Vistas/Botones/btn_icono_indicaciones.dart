import 'package:flutter/material.dart';

class BtnIconoIndicaciones extends StatefulWidget {
  const BtnIconoIndicaciones({super.key});

  @override
  State<BtnIconoIndicaciones> createState() => _BtnIconoIndicacionesState();
}

class _BtnIconoIndicacionesState extends State<BtnIconoIndicaciones> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Container(
      width: 52 * fem,
      height: 52 * fem,
      margin: const EdgeInsets.only(top: 2),
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
          shape: BoxShape.circle),
      child: const Icon(
        Icons.near_me,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
