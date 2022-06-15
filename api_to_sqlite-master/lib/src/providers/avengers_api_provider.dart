import 'package:api_to_sqlite/src/models/avengers_model.dart';
import 'package:api_to_sqlite/src/providers/db_provider.dart';
import 'package:dio/dio.dart';

class AvengersApiProvider {
  Future<List<Avenger?>> getAllAvengers() async {
    var url = "https://demo1563554.mockable.io/avengers";
    Response response = await Dio().get(url);

    return (response.data as List).map((avenger) {
      // ignore: avoid_print
      print('Inserting $avenger');
      DBProvider.db.initDB();
      DBProvider.db.createAvenger(Avenger.fromJson(avenger));
    }).toList();
  }
}
