import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//if the package is not automatically imported then get dependencies


class DatabaseHelper{ //everything static to give class access to variables

  //about database
  static final _dbName = "myDatabase.db";
  static final _dbVersion = 1;

  DatabaseHelper._privateConstructor();  //singleton class
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async{  //async = incase it takes sometime to retrieve the data
    if(_database != null){
      return _database;
    }
    //else initalize db and return it
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase () async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName); //join file name and dir

    //onCreate execute after open
    await openDatabase(path, version: _dbVersion, onCreate: _onCreate); //open db in path


  }

  Future _onCreate(Database db, int version){
    
  }

}