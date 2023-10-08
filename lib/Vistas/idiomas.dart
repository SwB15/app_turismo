import 'package:app_turismo/perfil.dart';
import 'package:flutter/material.dart';

class Idiomas extends StatefulWidget {
  const Idiomas({super.key});

  @override
  State<StatefulWidget> createState() => _Idiomas();
}

class _Idiomas extends State<Idiomas> {
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
          'Idiomas',
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //Idioma Arabe
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                child: const Text(
                  'Árabe',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
            ),

            //Idioma Bieloruso
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Bielorruso',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Bulgaro
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Búlgaro',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Catalan
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Catalán',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Checheno
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Checheno',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Chino
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Chino',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Croata
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Croata',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Checo
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Checo',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Danes
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Danés',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Holandes
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Neerlandés(Holandés)',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Ingles
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Inglés',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Frances
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Francés',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Aleman
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Alemám',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Griego
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Griego',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Guarani
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Guaraní',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Hindi
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Hindi',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Indonesio
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Indonesio',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Irlandes
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Irlandés',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Italiano
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Italiano',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Japones
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Japones',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma coreano
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Coreano',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Lituano
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Lituano',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Luxemburgues
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Luxemburgués',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Moldavo
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Moldavo',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Nepali
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Nepalí',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Noruego
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Noruego',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Polaco
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Polaco',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Portugues
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Portugués',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Rumano
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Rumano',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Ruso
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Ruso',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Servio
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Servio',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Eslovaco
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Eslovaco',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma español
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Español',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Sueco
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Sueco',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Tailandés
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Tailandés',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma Turco
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Turco',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma ucraniano
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Ucraniano',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma vietnamita
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Vietnamita',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Idioma gales
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Galés',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
