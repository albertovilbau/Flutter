import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:scooby_app/src/models/actores_model.dart';

class ActoresProvider {
  String _apikey = 'fa7d1478319b48ecf313e7a408282491';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPage = 0;
  bool _cargando = false;

  final _popularesStreamController = StreamController<List<Actor>>.broadcast();

  Function(List<Actor>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Actor>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  List<Actor> _actorespopulares = [];

  Future<List<Actor>> getActoresPopulares() async {
    if (_cargando) return [];

    _cargando = true;
    _popularesPage++;

    final url = Uri.https(_url, '3/person/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
    }); // Pelicula
    final resultado = await _procesarRespuestaActores(url);

    _actorespopulares.addAll(resultado);
    popularesSink(_actorespopulares);

    _cargando = false;
    return resultado;
  }

  Future<List<Actor>> _procesarRespuestaActores(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = new Cast.fromJsonList(decodedData['results']);

    return cast.actores;
  }

  Future<List<Actor>> getPeliculas(String uniqueid) async {
    final url = Uri.https(_url, '3/person/$uniqueid/movie_credits',
        {'api_key': _apikey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = new Cast.fromJsonList(decodedData['cast']);

    return cast.actores;
  }
}
