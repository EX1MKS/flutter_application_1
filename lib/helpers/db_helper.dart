import 'package:flutter_application_1/models/profile.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'profiles_v2.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE tb_profile (
              id08 INTEGER PRIMARY KEY AUTOINCREMENT,
              coverphoto08 TEXT,
              profilephoto08 TEXT,
              name08 TEXT,
              bio08 TEXT,
              desc08 TEXT,
              phonenumber08 TEXT
          )
        ''');
      },
      );
  }

  static Future<List<Profile>> getProfiles() async {
    final db = await database;
    final data = await db.query('tb_profile');
    return data.map((item) => Profile.fromMap(item)).toList();
  }

  static Future<int> insertProfile(Profile profile) async {
    final db = await database;
    return await db.insert('tb_profile', profile.toMap());
  }

  static Future<int> updateProfile(Profile profile) async {
    final db = await database;
    return await db.update(
      'tb_profile',
      profile.toMap(),
      where: 'id08 = ?',
      whereArgs: [profile.id08],
      );
  }

  static Future<int>deleteProfile(int id08) async {
    final db = await database;
    return await db.delete('tb_profile', where: 'id08 = ?', whereArgs: [id08]);
  }

  static Future<void> closeDB() async {
    final db = await database;
    await db.close();
    _database = null;
  } 
}

