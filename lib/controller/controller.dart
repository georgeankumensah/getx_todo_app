import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class SQLController extends GetxController {
  @override
  void onInit() {
    createDatabase();
    super.onInit();
  }

  void createDatabase() async {
    // get location using getDatabasePath
    var databasePath = await getDatabasesPath();

    String path = join(databasePath, "todo.db");
    openAppDatabase(path: path);
  }

  void openAppDatabase({required String path}) async {
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT, description INTEGER, favourite INTEGER,completed INTEGET)');
      debugPrint("database is created");
    }, onOpen: (Database database) { 
      debugPrint("Database is opened");
    });
  }

  void deleteDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    // Delete the database
    deleteDatabase();
    debugPrint("database deleted");
  }

  void getAllData() {}

  void insertData() {}

  void updateData() {}

  void deleteData() {}
}
