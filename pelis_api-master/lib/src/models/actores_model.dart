class Cast {
  List<Actor> actores = [];

  Cast();

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    // jsonList.forEach((item) {
    //   final actor = Actor.fromJsonMap(item);
    //   actores.add(actor);
    // });

    for (var item in jsonList) {
      final actor = new Actor.fromJsonMap(item);
      actores.add(actor);
    }
  }
}

class Actor {
  String castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;
  String person_id;
  String biography;
  String birthday;
  String popularity;
  String place_of_birth;
  String title;
  String posterPath;
  String backdrop_path;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
    this.person_id,
    this.biography,
    this.birthday,
    this.popularity,
    this.place_of_birth,
    this.title,
    this.posterPath,
    this.backdrop_path,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'].toString();
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
    person_id = json['person_id'];
    biography = json['biography'];
    birthday = json['birthday'].toString();
    popularity = json['popularity'].toString();
    place_of_birth = json['place_of_birth'];
    title = json['title'];
    posterPath = json['poster_path'];
    backdrop_path = json['backdrop_path'];
  }

  getFoto() {
    if (profilePath == null) {
      return 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }

  getRelatedPosterImg() {
    if (posterPath == null) {
      return 'https://media.istockphoto.com/vectors/no-image-available-sign-vector-id922962354?k=20&m=922962354&s=170667a&w=0&h=mRTFds0L_Hq63ohdqIdHXMrE32DqOnajt4I0yJ1bBtU=';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getGenero() {
    if (gender == 2) {
      return 'Hombre';
    } else if (gender == 1) {
      return 'Mujer';
    } else {
      return 'Otro';
    }
  }
}
