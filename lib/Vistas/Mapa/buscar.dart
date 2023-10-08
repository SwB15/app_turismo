import 'package:flutter/material.dart';

class Buscar extends StatefulWidget {
  const Buscar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Buscar createState() => _Buscar();
}

class _Buscar extends State<Buscar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    color: Color(0xFFBDBDBD),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Buscar',
                    style: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: const Icon(
              Icons.filter_list_alt,
              color: Color(0xFF01B763),
            ),
          ),
        ],
      ),
    );
  }
}
