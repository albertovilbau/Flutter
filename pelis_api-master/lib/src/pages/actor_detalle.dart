import 'package:flutter/material.dart';

import 'package:scooby_app/src/models/actores_model.dart';
import 'package:scooby_app/src/providers/actores_provider.dart';

import 'package:scooby_app/src/providers/peliculas_provider.dart';
import 'package:scooby_app/src/models/pelicula_model.dart';

class ActorDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Actor actor = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _crearAppbar(actor),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: 10.0),
            _posterTitulo(context, actor),
            _descripcion(actor),
            _crearPeliculasRelacionadas(actor)
          ]),
        )
      ],
    ));
  }

  Widget _crearAppbar(Actor actor) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.redAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          actor.name,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(
              "https://image.tmdb.org/t/p/w500" + actor.profilePath),
          //image: NetworkImage(pelicula.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          //fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, Actor actor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: actor.castId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(actor.getFoto()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(actor.name,
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(actor.popularity,
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.home),
                    Text(actor.place_of_birth ?? "No encontrado",
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.transgender),
                    Text(actor.getGenero(),
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _descripcion(Actor actor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        actor.biography ?? 'Biografía no encontrada.',
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearPeliculasRelacionadas(Actor actor) {
    final actoresprovider = new ActoresProvider();

    return FutureBuilder(
      future: actoresprovider.getPeliculas(actor.id.toString()),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _crearPeliculasRelacionadasPageView(snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearPeliculasRelacionadasPageView(List<Actor> actores) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(viewportFraction: 0.3, initialPage: 1),
        itemCount: actores.length,
        itemBuilder: (context, i) => _pelicularelacionadaTarjeta(actores[i]),
      ),
    );
  }

  Widget _pelicularelacionadaTarjeta(Actor actor) {
    return Container(
        child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: FadeInImage(
            image: NetworkImage(actor.getRelatedPosterImg()),
            placeholder: AssetImage('assets/img/no-image.jpg'),
            height: 150.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          actor.title,
          overflow: TextOverflow.ellipsis,
        )
      ],
    ));
  }
}
