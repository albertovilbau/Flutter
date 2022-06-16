import 'package:firebase_database/firebase_database.dart';
import 'progreso.dart';

class ProgresoDAO {

  final DatabaseReference _progress = FirebaseDatabase.instance.reference()
      .child('mensajes');

  void guardarMensaje(coleccion_progreso prgoreso) {
    _progress.push().set(prgoreso.toJson());
  }

  Query getProgreso()=> _progress;

}