import 'package:flutter/material.dart';
import 'dart:async';
import 'equipo.dart';

class paginaEquipos extends StatefulWidget {
  final Equipo equipo;
  paginaEquipos(this.equipo);

  @override
  _paginaEquipos createState() => new _paginaEquipos();
}

class _paginaEquipos extends State<paginaEquipos> {
  final double sizeEscudo = 150.0;

  double _sliderValue = 10.0;

  Widget get addYourRating {
    return new Column(
      children: <Widget>[
        new Container(
          color: Colors.red.shade200,
          padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                flex: 1,
                child: new Slider(
                  activeColor: Colors.red,
                  min: 0.0,
                  max: 10.0,
                  value: _sliderValue,
                  onChanged: (newRating) {
                    setState(() {
                      _sliderValue = newRating;
                    });
                  },
                ),
              ),
              new Container(
                  color: Colors.red.shade200,
                  width: 50.0,
                  alignment: Alignment.center,
                  child: new Text(
                    '${_sliderValue.toInt()}',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  )),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }

  void updateRating() {
    if (_sliderValue < 5) {
      _ratingErrorDialog();
    } else {
      setState(() {
        widget.equipo.rating = _sliderValue.toInt();
      });
    }
  }

  Future<Null> _ratingErrorDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Error!'),
            content: new Text("Tampoco son tan malos...."),
            actions: <Widget>[
              new TextButton(
                child: new Text('Intentalo otra vez'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  Widget get submitRatingButton {
    return new ElevatedButton(
      onPressed: () => updateRating(),
      child: new Text('Submit'),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
    );
  }

  Widget get imagenEquipo {
    return new Hero(
      tag: widget.equipo,
      child: new Container(
        height: sizeEscudo,
        width: sizeEscudo,
        constraints: new BoxConstraints(),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                  offset: const Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: -1.0,
                  color: const Color(0x33000000)),
              const BoxShadow(
                  offset: const Offset(2.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  color: const Color(0x24000000)),
              const BoxShadow(
                  offset: const Offset(3.0, 1.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  color: const Color(0x1f000000))
            ],
            image: new DecorationImage(
                fit: BoxFit.scaleDown,
                image: new NetworkImage(widget.equipo.imageUrl ?? ''))),
      ),
    );
  }

  Widget get rating {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.star,
          size: 40.0,
          color: Colors.black,
        ),
        new Text('${widget.equipo.rating}/10',
            style: TextStyle(color: Colors.black, fontSize: 30.0))
      ],
    );
  }

  Widget get infoEquipo {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      decoration: new BoxDecoration(
        color: Colors.red.shade200,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          imagenEquipo,
          new Text('${widget.equipo.name}',
              style: TextStyle(color: Colors.black, fontSize: 32.0)),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: rating,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red[200],
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text(
          '${widget.equipo.name}',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: new ListView(
        children: <Widget>[infoEquipo, addYourRating],
      ),
    );
  }
}
