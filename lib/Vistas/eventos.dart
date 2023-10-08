import 'package:app_turismo/Vistas/Agregar/agregar_evento.dart';
import 'package:app_turismo/Vistas/calendario.dart';
import 'package:app_turismo/perfil.dart';
import 'package:flutter/material.dart';

class Eventos extends StatefulWidget {
  const Eventos({super.key});

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  // Variable para almacenar la fecha seleccionada
  DateTime? selectedDate;

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
                .push(MaterialPageRoute(builder: (context) => const Cuenta()));
          },
        ),
        title: const Text(
          'Agregar Eventos',
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //Boton de Agregar eventos
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AgregarEvento()));
                },
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 0),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF01924F),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0.0, 5.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),

                    //Texto del boton "Agregar nuevo evento"
                    child: Container(
                      margin: const EdgeInsets.only(left: 0, right: 0),
                      child: const Text(
                        'Agregar nuevo Evento',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),

              //Separador
              const SizedBox(
                height: 20,
              ),

              //Calendario
              Calendario(
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date; // Almacena la fecha seleccionada
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
