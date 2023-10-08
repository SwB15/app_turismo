// ignore_for_file: avoid_print

import 'package:app_turismo/perfil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Politicas extends StatefulWidget {
  const Politicas({super.key});

  @override
  State<StatefulWidget> createState() => _Politicas();
}

class _Politicas extends State<Politicas> {
  //Añadir
  Future<void> _addData(String task) async {
    Timestamp date = Timestamp.fromDate(DateTime.now());
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    return tasks
        .add({'tasks': task, 'date': date, 'number': 6})
        .then(
          (value) => print('nueva tarea añadida'),
        )
        .catchError(
          (error) => print('Fallo al agregar la tarea a Firebase'),
        );
  }

  //Actualizar
  Future<void> _updateData(String id) async {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    return tasks
        .doc(id)
        .update({'name': 'John', 'age': 30, 'address': 'address'})
        .then((value) => print('Los datos han sido actualizados'))
        .catchError(
            (error) => print('Fallo al actualizar la tarea en Firebase'));
  }

  //Eliminar
  Future<void> _deleteData(String id) async {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    return tasks
        .doc(id)
        .delete()
        .then((value) => print('Los datos han sido eliminados'))
        .catchError((error) => print('Fallo al eliminar la tarea en Firebase'));
  }

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
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Turismo Misiones'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Algo malo paso'),
                );
              }
              if (snapshot.connectionState == ConnectionState.active) {
                return ListView(
                    children: snapshot.data!.docs.map((document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return GestureDetector(
                    onTap: () {
                      _updateData(document.id);
                    },
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(data['tasks']),
                        subtitle: Text(data['number'].toString()),
                        trailing: IconButton(
                            onPressed: () {
                              _deleteData(document.id);
                            },
                            icon: const Icon(Icons.delete_forever_rounded)),
                      ),
                    ),
                  );
                }).toList());
              }
              return const Center(
                child: Text('Cargando...'),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addData('Crear CRUD otra vez');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
