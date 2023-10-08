import 'package:flutter/material.dart';

class BtnIndicaciones extends StatefulWidget {
  const BtnIndicaciones({super.key});

  @override
  State<BtnIndicaciones> createState() => _BtnIndicacionesState();
}

class _BtnIndicacionesState extends State<BtnIndicaciones> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        decoration: const BoxDecoration(
          color: Color(0xFF01924F),
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),

        //Texto del boton "Indicaciones"
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: const Text(
            'Indicaciones',
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
