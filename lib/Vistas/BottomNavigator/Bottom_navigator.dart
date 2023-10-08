// ignore_for_file: file_names

import 'package:app_turismo/perfil.dart';
import 'package:flutter/material.dart';

class BNavigator extends StatefulWidget {
  final Function currentIndex;
  const BNavigator({super.key, required this.currentIndex});

  @override
  // ignore: library_private_types_in_public_api
  _NavigatorState createState() => _NavigatorState();
}

class _NavigatorState extends State<BNavigator> {
  final List<bool> _isSelected = List<bool>.generate(4, (int index) => false);

  void _onItemTapped(int index) {
    setState(() {
      _isSelected[index] = !_isSelected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: const Color(0xFF9E9E9E),
      selectedItemColor: const Color(0xFF01B763),
      iconSize: 25,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: 'Destinos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_hotel_outlined),
          label: 'Alojamientos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_dining_outlined),
          label: 'Comidas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_outlined),
          label: 'Eventos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity_outlined),
          label: 'Perfil',
        ),
      ],
      onTap: (int index) {
        setState(() {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cuenta()),
            );
          } else {
            /*_selections[index] = !_selections[index];
            widget.currentIndex(index, _selections[index]);*/
          }
        });
      },
    );
  }
}
