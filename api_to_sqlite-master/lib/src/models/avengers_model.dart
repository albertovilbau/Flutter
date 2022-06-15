import 'dart:convert';

List<Avenger> avengerFtomJson(String str) =>
    List<Avenger>.from(json.decode(str).map((x) => Avenger.fromJson(x)));

String avengerToJson(List<Avenger> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Avenger {
  int? id;
  String? nickname;
  String? name;
  String? lastname;
  String? img;

  Avenger({
    this.id,
    this.nickname,
    this.name,
    this.lastname,
    this.img,
  });

  factory Avenger.fromJson(Map<String, dynamic> json) => Avenger(
        id: json["id"],
        nickname: json["nickname"],
        name: json["name"],
        lastname: json["lastname"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "name": name,
        "lastname": lastname,
        "img": img,
      };
}
