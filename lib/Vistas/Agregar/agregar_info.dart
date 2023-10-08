// ignore_for_file: use_build_context_synchronously

import 'package:app_turismo/perfil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AgregarInfo extends StatefulWidget {
  const AgregarInfo({super.key});

  @override
  State<StatefulWidget> createState() => _AgregarInfo();
}

class _AgregarInfo extends State<AgregarInfo> {
  //El horario debe guardarse como Map, Firebase no acepta List<>
  Map<String, Map<String, String>> horarios = {
    'Domingo': {'apertura': '00:00', 'cierre': '00:00'},
    'Lunes': {'apertura': '00:00', 'cierre': '00:00'},
    'Martes': {'apertura': '00:00', 'cierre': '00:00'},
    'Miércoles': {'apertura': '00:00', 'cierre': '00:00'},
    'Jueves': {'apertura': '00:00', 'cierre': '00:00'},
    'Viernes': {'apertura': '00:00', 'cierre': '00:00'},
    'Sábado': {'apertura': '00:00', 'cierre': '00:00'},
  };

  String dropdownValue = 'Destino';
  final checkedValues = List<bool>.filled(34, false);
  int maxSelected = 8; // Número máximo de comodidades seleccionadas

  //Variables para los campos de TextField
  TextEditingController nombreController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController latitudController = TextEditingController();
  TextEditingController longitudController = TextEditingController();

  //Nombre de las comodidades a ser seleccionadas
  List<String> comodidadesTitles = [
    "Wifi",
    "Restaurant",
    "Baños",
    "Tiendas",
    "Aire libre",
    "Guias",
    "Estacionamientos",
    "Sin costo",
    "Ambiente Climatizado",
    "Patio de Comidas",
    "Museo",
    "Sin celulares",
    "Silencioso",
    "Alojamiento",
    "Naturaleza",
    "Bebidas",
    "Discapacitados",
    "Sin electricidad",
    "Vista panorámica",
    "Risco",
    "Llanura",
    "Fiestas",
    "Realidad Aumentada",
    "Sin flash",
    "Senderismo",
    "Bicicletas",
    "Sin señal",
    "Sin mascotas",
    "Animales peligrosos",
    "QR",
    "Ambulancia",
    "Resbaloso",
    "Empinado",
    "Insectos",
  ];

  // Función para crear una fila de día
  Widget buildDayRow(String day) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                day,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SafeArea(
              child: TextButton(
                onPressed: () => seleccionarHora(day, 'apertura'),
                child: Text(
                  horarios[day]!['apertura']!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            const Text(' - '),
            SafeArea(
              child: TextButton(
                onPressed: () => seleccionarHora(day, 'cierre'),
                child: Text(
                  horarios[day]!['cierre']!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xFFEEEEEE),
          thickness: 2,
        ),
      ],
    );
  }

  // Función para crear un campo de entrada con estilo
  Widget buildStyledInputField(String label, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(0.0, 5.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: TextField(
        controller: controller, // Asocia el controlador al TextField
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }

  // Función para mostrar el aviso de comodidades alcanzadas
  void showMaxComodidadesSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Máximo de 8 comodidades alcanzado!'),
      ),
    );
  }

  //Funcion para seleccionar hora de apertura y cierre
  Future<void> seleccionarHora(String day, String horaType) async {
    final TimeOfDay? horaSeleccionada = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    );

    if (horaSeleccionada != null) {
      setState(() {
        horarios[day]![horaType] = horaSeleccionada.format(context);
      });
    }
  }

  //Función para guardar la información en Firestore
  Future<void> guardarInformacionEnFirestore() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final CollectionReference lugaresCollection =
          firestore.collection('lugares');

      // Convertir las cadenas de latitud y longitud en números de punto flotante
      double latitud = double.parse(latitudController.text);
      double longitud = double.parse(longitudController.text);

      // Crear un objeto GeoPoint
      GeoPoint ubicacion = GeoPoint(latitud, longitud);

      // Guardar información en Firestore
      await lugaresCollection.add({
        'nombre': nombreController.text,
        'direccion': direccionController.text,
        'ubicacion': ubicacion, // Usar el objeto GeoPoint
        'horarios': horarios,
        'comodidades': checkedValues.asMap().map(
            (index, selected) => MapEntry(comodidadesTitles[index], selected)),
        // Agrega más campos según tus necesidades
      });

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Información guardada en Firestore.'),
        ),
      );
    } catch (error) {
      // Manejar errores aquí
    }
  }

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
          'Agregar Lugares',
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Column(
            children: [
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Destino', 'Alojamiento', 'Comidas']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              //Separador entre Nombre y Direccion
              const SizedBox(
                height: 20,
              ),

              //Columnas apara ingresar los datos de nombre, direccion, latitud y longitud
              Column(
                children: [
                  buildStyledInputField('Nombre', nombreController),
                  const SizedBox(height: 10),
                  buildStyledInputField('Direccion', direccionController),
                  const SizedBox(height: 10),
                  buildStyledInputField('Latitud', latitudController),
                  const SizedBox(height: 10),
                  buildStyledInputField('Longitud', longitudController),
                ],
              ),

              //Separador entre campos de escritura y horarios
              const SizedBox(
                height: 30,
              ),

              //Container de horarios de apertura y cierre
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFEEEEEE),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Horarios',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    buildDayRow('Domingo'),
                    buildDayRow('Lunes'),
                    buildDayRow('Martes'),
                    buildDayRow('Miércoles'),
                    buildDayRow('Jueves'),
                    buildDayRow('Viernes'),
                    buildDayRow('Sábado'),
                  ],
                ),
              ),

              //Separador
              const SizedBox(
                height: 20,
              ),

              //Container de comodidades
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFEEEEEE),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Comodidades',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),

                    // Separador
                    const SizedBox(
                      height: 10,
                    ),

                    // Separador gris
                    const Divider(
                      color: Color(0xFFEEEEEE),
                      thickness: 2,
                    ),

                    Wrap(
                      children: comodidadesTitles.map((title) {
                        final index = comodidadesTitles.indexOf(title);
                        return CheckboxListTile(
                          title: Row(
                            children: [
                              Text(
                                title,
                              ),
                            ],
                          ),
                          value: checkedValues[index],
                          onChanged: (newValue) {
                            setState(
                              () {
                                if (newValue == true) {
                                  // Verificar si se han seleccionado más de 8 elementos
                                  if (checkedValues
                                          .where((value) => value)
                                          .length >=
                                      maxSelected) {
                                    showMaxComodidadesSnackBar(context);
                                    return; // No permite seleccionar más elementos
                                  }
                                }
                                checkedValues[index] = newValue!;
                              },
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //Eventos
              Column(
                children: [
                  //Texto de Eventos
                  const Text(
                    'Eventos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                  //Separador entre texto Eventos y calendario
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
                      border:
                          Border.all(color: const Color(0xFFEEEEEE), width: 2),
                    ),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                    ),
                  )
                ],
              ),

              //Separador entre "Calendario" y "Boton Guardar Informacion"
              const SizedBox(
                height: 20,
              ),

              //Boton de Guardar informacion
              GestureDetector(
                onTap: () {
                  guardarInformacionEnFirestore();
                },
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
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

                    //Texto del boton "Guardar Información"
                    child: Container(
                      margin: const EdgeInsets.only(left: 0, right: 0),
                      child: const Text(
                        'Guardar Información',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
