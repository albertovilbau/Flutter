import 'package:flutter/material.dart';
import 'dart:async';
import 'lista_equipos.dart';
import 'nuevo_equipo.dart';
import 'equipo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equipos Liga Santander',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Equipos de La Liga',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Equipo> equiposIniciales = []
    ..add(Equipo('Real Madrid'))
    ..add(Equipo('Real Sociedad'))
    ..add(Equipo('F.C. Barcelona'));

  Future _mostraNuevoEquipo() async {
    Equipo nuevoEquipo = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return nuevo_equipo();
    }));
    //print(newDigimon);
    if (nuevoEquipo != null) {
      equiposIniciales.add(nuevoEquipo);
    }
    setState(() {});
  }

  VoidCallback refreshstate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title, style: TextStyle(color: Colors.red)),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: refreshstate,
          ),
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _mostraNuevoEquipo,
          ),
        ],
      ),
      body: new Container(
        color: Colors.red.shade200,
        child: new Center(
          child: new lista_equipos(equiposIniciales),
        ),
      ),
    );
  }
}
