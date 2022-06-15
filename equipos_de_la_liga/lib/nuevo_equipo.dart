import 'package:flutter/material.dart';
import 'package:digimon_app/equipo.dart';

class nuevo_equipo extends StatefulWidget {
  @override
  _nuevo_equipo createState() => new _nuevo_equipo();
}

class _nuevo_equipo extends State<nuevo_equipo> {
  TextEditingController nameController = new TextEditingController();

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.redAccent,
        content: new Text('Has olvidado añadir el nombre del equipo.'),
      ));
    } else {
      var nuevoEquipo = new Equipo(nameController.text);
      Navigator.of(context).pop(nuevoEquipo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Añade nuevo equipo (Primera división)'),
        backgroundColor: Colors.black,
      ),
      body: new Container(
        color: Colors.red[200],
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Column(children: [
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: nameController,
                style: TextStyle(decoration: TextDecoration.none),
                //onChanged: (v) => nameController.text = v,
                decoration: new InputDecoration(
                  labelText: 'Nombre del equipo',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Builder(
                builder: (context) {
                  return new ElevatedButton(
                      onPressed: () => submitPup(context),
                      child: new Text('Añade el equipo'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)));
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
