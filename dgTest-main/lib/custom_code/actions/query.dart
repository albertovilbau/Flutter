// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
final firestoreInstance = FirebaseFirestore.instance;
Future query() async {
  var result = await firestoreInstance
      .collection("preguntas_senales")
      .where("idu", isEqualTo: 1)
      .get();
}
