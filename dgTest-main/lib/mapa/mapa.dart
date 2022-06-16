import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'pagina.dart';

class Mapa extends Pagina {
  Mapa() : super(const Icon(Icons.map), "Mapa UI");

  @override
  Widget build(BuildContext context) {
    return const MapaUI();
  }
}

class MapaUI extends StatefulWidget {
  const MapaUI();

  @override
  State<StatefulWidget> createState() => MapaUIState();
}

class MapaUIState extends State<MapaUI> {
  MapaUIState();

  static final CameraPosition _posicionInicial = const CameraPosition(
    target: LatLng(41.3879, 2.16992),
    zoom: 11.0,
  );

  CameraPosition _posicion = _posicionInicial;
  bool _estaMapaCreado = false;
  bool _estaMoviendose = false;
  bool _brujulaActiva = true;
  bool _barraHerramientasMapaActiva = true;
  CameraTargetBounds _limitesCamara = CameraTargetBounds.unbounded;
  MinMaxZoomPreference _preferenciasMinMaxZoom = MinMaxZoomPreference.unbounded;
  MapType _tipoMapa = MapType.normal;
  bool _gestoRotacionActivado = true;
  bool _gestoScrollActivado = true;
  bool _gestoInclinacionActivado = true;
  bool _controlesZoomActivos = true;
  bool _gestoZoomActivo = true;
  bool _vistaInteriorActiva = true;
  bool _miTraficoActivo = false;
  bool _botonLocalizacionActivo = true;
  bool _localizacionActiva = true;
  //late GoogleMapController _controller;
  bool _modoNocturno = false;

  static final Marker _AutoEscuelaJavier = Marker(
    markerId: MarkerId('AutoJavier'),
    infoWindow: InfoWindow(
      title: 'Auto Escuela Javier',
    ),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.35985719783915, 2.0753714233081864),
  );

  static final Marker _AutoEscuelaRoca = Marker(
    markerId: MarkerId('AutoRoca'),
    infoWindow: InfoWindow(title: 'Auto Escuela H.Roca'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.37769738400175, 2.0850277896443714),
  );

  static final Marker _AutoEscuelaZonaF = Marker(
    markerId: MarkerId('LaCampana'),
    infoWindow: InfoWindow(title: 'Auto Escuela Zonfa F La Campana'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.367110694542376, 2.1402624088664703),
  );

  static final Marker _AutoEscuelaHoyVoyHospi = Marker(
    markerId: MarkerId('HoyVoyHospi'),
    infoWindow: InfoWindow(title: 'Auto Escuela Hoy-Voy Hospitalet'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.36758571299654, 2.1276238404620758),
  );

  static final Marker _AutoEscuelaElCarmel = Marker(
    markerId: MarkerId('ElCarmel'),
    infoWindow: InfoWindow(title: 'Auto Escuela El Carmel'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.42563509268196, 2.155025272709037),
  );

  static final Marker _AutoEscuelaGomar = Marker(
    markerId: MarkerId('Gomar'),
    infoWindow: InfoWindow(
      title: 'Auto Escuela Gomar Barcelona',
    ),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.39190319097596, 2.1793153566274803),
  );

  static final Marker _AutoEscuelaHoyVoyCentro = Marker(
    markerId: MarkerId('HoyVoyCentro'),
    infoWindow: InfoWindow(
      title: 'Auto Escuela Hoy-Voy Barcelona Centro',
    ),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.39892138412775, 2.1557977487329505),
  );

  static final Marker _AutoEscuelaCorsaSarria = Marker(
    markerId: MarkerId('CorsaSarria'),
    infoWindow: InfoWindow(title: 'Auto Escuela Corsa Sarria'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.39641238644506, 2.125196425967294),
  );

  @override
  Widget build(BuildContext context) {
    final GoogleMap googleMap = GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: _posicionInicial,
      compassEnabled: _brujulaActiva,
      mapToolbarEnabled: _barraHerramientasMapaActiva,
      cameraTargetBounds: _limitesCamara,
      minMaxZoomPreference: _preferenciasMinMaxZoom,
      mapType: _tipoMapa,
      markers: {
        _AutoEscuelaJavier,
        _AutoEscuelaRoca,
        _AutoEscuelaHoyVoyHospi,
        _AutoEscuelaZonaF,
        _AutoEscuelaElCarmel,
        _AutoEscuelaGomar,
        _AutoEscuelaHoyVoyCentro,
        _AutoEscuelaCorsaSarria,
      },
      rotateGesturesEnabled: _gestoRotacionActivado,
      scrollGesturesEnabled: _gestoScrollActivado,
      tiltGesturesEnabled: _gestoInclinacionActivado,
      zoomGesturesEnabled: _gestoZoomActivo,
      zoomControlsEnabled: _controlesZoomActivos,
      indoorViewEnabled: _vistaInteriorActiva,
      myLocationEnabled: _localizacionActiva,
      myLocationButtonEnabled: _botonLocalizacionActivo,
      trafficEnabled: _miTraficoActivo,
      onCameraMove: _actualizarPosicionCamara,
    );

    final List<Widget> columnChildren = <Widget>[
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: SizedBox(
            width: 500.0,
            height: 550.0,
            child: googleMap,
          )))
    ];

    if (_estaMapaCreado) {
      columnChildren.add(Expanded(
          child: ListView(
        children: <Widget>[
          _botonTipoMapa(),
          _botonMiTrafico(),
        ],
      )));
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: columnChildren);
  }

  Widget _botonTipoMapa() {
    final MapType tipoactual = MapType.values[_tipoMapa.index];
    return RawMaterialButton(
      child: Icon(
        Icons.map,
        color: Color.fromARGB(255, 255, 94, 0),
      ),
      onPressed: () {
        setState(() {
          _tipoMapa =
              MapType.values[(_tipoMapa.index + 1) % MapType.values.length];
        });
      },
    );
  }

  Widget _botonMiTrafico() {
    return RawMaterialButton(
      child: Icon(Icons.traffic_sharp, color: Color.fromARGB(255, 255, 94, 0)),
      onPressed: () {
        setState(() {
          _miTraficoActivo = !_miTraficoActivo;
        });
      },
    );
  }

  void _actualizarPosicionCamara(CameraPosition posicion) {
    setState(() {
      _posicion = posicion;
    });
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      //_controller = controller;
      _estaMapaCreado = true;
    });
  }
}
