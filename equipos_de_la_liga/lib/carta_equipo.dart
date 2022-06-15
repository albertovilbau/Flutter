import 'package:digimon_app/equipo.dart';
import 'paginaEquipos.dart';
import 'package:flutter/material.dart';
import 'equipo.dart';

class carta_equipo extends StatefulWidget {
  final Equipo equipo;

  carta_equipo(this.equipo);

  @override
  _carta_equipo createState() => _carta_equipo(equipo);
}

class _carta_equipo extends State<carta_equipo> {
  Equipo equipo;
  String renderUrl;

  _carta_equipo(this.equipo);

  void initState() {
    super.initState();
    renderEscudoEquipo();
  }

  Widget get imagenEquipo {
    var escudo_equipo = new Hero(
      tag: equipo,
      child: new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.scaleDown,
                image: new NetworkImage(renderUrl ?? ''))),
      ),
    );

    var placeholder = new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black54, Colors.black, Colors.blueGrey[600]])),
      alignment: Alignment.center,
      child: new Text(
        'EQUIPO',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = new AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: escudo_equipo,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  void renderEscudoEquipo() async {
    await equipo.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = equipo.imageUrl;
      });
    }
  }

  Widget get carta_equipo {
    return new Positioned(
      right: 0.0,
      child: new Container(
        width: 290,
        height: 115,
        child: new Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Colors.black,
          child: new Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 64),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  widget.equipo.name,
                  style: TextStyle(color: Colors.white, fontSize: 27.0),
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.star, color: Colors.white),
                    new Text('${widget.equipo.rating}/10',
                        style: TextStyle(color: Colors.white, fontSize: 14.0))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  mostrarCarta_Equipo() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new paginaEquipos(equipo);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => mostrarCarta_Equipo(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: new Container(
          height: 115.0,
          child: new Stack(
            children: <Widget>[
              carta_equipo,
              new Positioned(top: 7.5, child: imagenEquipo),
            ],
          ),
        ),
      ),
    );
  }
}
