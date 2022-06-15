import 'dart:async';

class Equipo {
  final String name;
  String imageUrl;
  String equipo;
  String valoracion;

  Equipo(this.name);

  int rating;

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    try {
      equipo = name.toLowerCase();

      if (equipo == "real madrid") {
        imageUrl =
            "http://assets.stickpng.com/images/584a9b47b080d7616d298778.png";
        rating = 10;
      } else if (equipo == "real sociedad") {
        imageUrl =
            "http://assets.stickpng.com/images/584ad36ab519ea740933a8d3.png";
        rating = 10;
      } else if (equipo == "sevilla f.c.") {
        imageUrl =
            "http://assets.stickpng.com/thumbs/584ad291b519ea740933a8ba.png";
        rating = 10;
      } else if (equipo == "atlético de madrid") {
        imageUrl =
            "https://logodownload.org/wp-content/uploads/2017/02/atletico-madrid-logo-1.png";
        valoracion = "3";
      } else if (equipo == "real betis") {
        imageUrl =
            "http://assets.stickpng.com/thumbs/584ad396b519ea740933a8d9.png";
        rating = 10;
      } else if (equipo == "rayo vallecano") {
        imageUrl =
            "https://4.bp.blogspot.com/-_zd6Ki71Ob4/WVP6LrylPBI/AAAAAAABKLI/ORmfAPAzC3ouUmR66sFS0PP9MUczcTUTgCLcBGAs/s1600/Rayo%2BVallecano.png";
        rating = 10;
      } else if (equipo == "ca osasuna") {
        imageUrl =
            "https://1.bp.blogspot.com/-ssOl9xbL8uI/X4eqoJKJO0I/AAAAAAABg5M/gq-79uTczgootNSUGQYFJINoKku8jmzygCLcBGAsYHQ/s512/CA%2BOsasuna.png";
        rating = 10;
      } else if (equipo == "athletic de bilbao") {
        imageUrl =
            "http://assets.stickpng.com/images/584ad135b519ea740933a896.png";
        rating = 10;
      } else if (equipo == "f.c. barcelona") {
        imageUrl =
            "http://assets.stickpng.com/images/584a9b3bb080d7616d298777.png";
        rating = 10;
      } else if (equipo == "valencia") {
        imageUrl =
            "http://assets.stickpng.com/images/584ad186b519ea740933a89e.png";
        rating = 0;
      } else if (equipo == "rcd espanyol") {
        imageUrl =
            "https://madridcff.com/wp-content/uploads/espanyol-escudo-madrid-cff-andresbgm.png";
        rating = 0;
      } else if (equipo == "rcd mallorca") {
        imageUrl =
            "https://upload.wikimedia.org/wikipedia/commons/0/05/Escudo_de_RCD_Mallorca.png";
        rating = 10;
      } else if (equipo == "villareal") {
        imageUrl =
            "http://assets.stickpng.com/images/584a9b57b080d7616d298779.png";
        rating = 10;
      } else if (equipo == "granada") {
        imageUrl =
            "https://logodownload.org/wp-content/uploads/2021/02/granada-fc-logo-1.png";
        rating = 10;
      } else if (equipo == "celta de vigo") {
        imageUrl =
            "http://assets.stickpng.com/thumbs/584ad3c4b519ea740933a8df.png";
        rating = 10;
      } else if (equipo == "elche") {
        imageUrl =
            "http://assets.stickpng.com/thumbs/584ad4e5b519ea740933a901.png";
        rating = 10;
      } else if (equipo == "deportivo alavés") {
        imageUrl =
            "https://1.bp.blogspot.com/-O3s507kVoSM/XyGVTyPlB4I/AAAAAAABfak/5XabmMLPjnwYxDRl9zV-FShLvBrCCFEFwCLcBGAsYHQ/d/Deportivo%2BAlaves.png";
        rating = 10;
      } else if (equipo == "cádiz") {
        imageUrl =
            "http://assets.stickpng.com/thumbs/584ad7abb519ea740933a953.png";
        rating = 10;
      } else if (equipo == "levante") {
        imageUrl =
            "https://logodownload.org/wp-content/uploads/2018/11/levante-ud-logo-escudo.png";
        rating = 10;
      } else if (equipo == "getafe") {
        imageUrl =
            "https://upload.wikimedia.org/wikipedia/an/b/b8/Getafe_CF.png";
        rating = 0;
      } else {
        imageUrl = "https://cdn-icons-png.flaticon.com/512/2748/2748558.png";
        valoracion = "Club no encontrado";
      }

      print(valoracion);
    } catch (exception) {
      print(exception);
    }
  }
}
