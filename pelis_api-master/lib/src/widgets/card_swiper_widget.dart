import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:scooby_app/src/models/actores_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Actor> Cast;

  CardSwiper({@required this.Cast});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          Cast[index].castId = '${Cast[index].id}-tarjeta';

          return Hero(
            tag: Cast[index].castId,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'Actordetalle',
                      arguments: Cast[index]),
                  child: FadeInImage(
                    image: NetworkImage(Cast[index].getFoto()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                  ),
                )),
          );
        },
        itemCount: Cast.length,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
