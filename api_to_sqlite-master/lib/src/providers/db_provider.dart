import 'dart:io';
import 'package:api_to_sqlite/src/models/avengers_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Avengers table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'avengers_manager_3.db');

    // droptables();

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          'Create table AVENGER(id integer primary key,nickname text,name text,lastname text,img text)');
    });
  }

  droptables() async {
    final db = await database;
    db?.delete('AVENGER');
    print('Table Avengers deleted');
  }

  // Insert Avenger on database
  createAvenger(Avenger newAvenger) async {
    await deleteAllAvengers();
    final db = await database;
    final res = await db?.insert('AVENGER', newAvenger.toJson());

    return res;
  }

  // Delete all avengers
  Future<int?> deleteAllAvengers() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM AVENGER');

    return res;
  }

  Future<List<Avenger?>> getAllAvengers() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM AVENGER");

    List<Avenger> list =
        res!.isNotEmpty ? res.map((c) => Avenger.fromJson(c)).toList() : [];

    return list;
  }
}
