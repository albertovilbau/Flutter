import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'mapa.dart';

class Portada extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PortadaState();
}

class PortadaState extends State<Portada> {
  @override
  Widget build(BuildContext context) {
    List<Widget> opcionesDrawer = [];

    return new Scaffold(
      appBar: AppBar(
        title: Text("Autoescuelas afliadas con DGTest"),
        backgroundColor: Color.fromARGB(255, 255, 94, 0),
      ),
      body: Mapa(),
    );
  }
}
