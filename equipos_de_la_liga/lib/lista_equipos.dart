import 'package:digimon_app/carta_equipo.dart';
import 'package:flutter/material.dart';
import 'equipo.dart';

class lista_equipos extends StatelessWidget {
  final List<Equipo> equipos;
  lista_equipos(this.equipos);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: equipos.length,
      itemBuilder: (context, int) {
        return new carta_equipo(equipos[int]);
      },
    );
  }
}
