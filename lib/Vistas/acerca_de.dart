import 'package:app_turismo/perfil.dart';
import 'package:flutter/material.dart';

class AcercaDe extends StatefulWidget {
  const AcercaDe({super.key});

  @override
  State<StatefulWidget> createState() => _AcercaDe();
}

class _AcercaDe extends State<AcercaDe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Boton de retroceso
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Cuenta()));
          },
        ),
        title: const Text(
          'Cuenta',
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(),
      ),
    );
  }
}
