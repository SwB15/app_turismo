import 'package:cloud_firestore/cloud_firestore.dart';

class DBHelper {
  late FirebaseFirestore firestore;
  initialiase() {
    firestore = FirebaseFirestore.instance;
  }

  //Agregar a Firebase
  Future<void> agregar(Map<String, dynamic> data) {
    return firestore.collection('tasks').add({
      'tasks': data['tasks'],
      'date': data['date'],
      'desc': data['desc'],
    });
  }

  //Actualizar
  Future<void> actualizar(Map<String, dynamic> data, String id) {
    return firestore.collection('tasks').doc(id).update({
      'title': data['title'],
      'date': data['date'],
      'desc': data['desc'],
    });
  }

  //Eliminar una tarea
  Future<void> eliminar(String id) {
    return firestore.collection('tasks').doc(id).delete();
  }
}
