import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  final void Function(DateTime selectedDate) onDateSelected;

  const Calendario({required this.onDateSelected, Key? key}) : super(key: key);

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Texto de Eventos
        const Text(
          'Eventos',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),

        //Separador entre texto Eventos y calendario,
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
            border: Border.all(color: const Color(0xFFEEEEEE), width: 2),
          ),
          child: TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            onDaySelected: (selectedDate, _) {
              widget.onDateSelected(
                  selectedDate); // Llama a la función de devolución de llamada
            },
          ),
        ),

        //Devolver datos de Firestore
      ],
    );
  }
}
