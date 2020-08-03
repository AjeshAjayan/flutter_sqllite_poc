import 'package:path/path.dart';
import 'dart:async';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final _databaseName = 'user.db';

  final _databaseVersion = 2;

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
        CREATE TABLE users(
            user_id INTEGER PRIMARY KEY
          , username TEXT
          , password TEXT
        )
      ''',
    );
  }
}
