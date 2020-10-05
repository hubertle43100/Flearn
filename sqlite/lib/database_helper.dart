import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//if the package is not automatically imported then get dependencies


class DatabaseHelper{ //everything static to give class access to variables

  //about database
  static final _dbName = "myDatabase.db";
  static final _dbVersion = 1;
  static final _tableName = 'myTable';

  static final columnId = '_id';
  static final columnName = 'name';

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
     db.execute( //create table inside the query (change query to execute)
        '''
       CREATE TABLE $_tableName( 
       $columnId INTEGER PRIMARY KEY,
       $columnName TEXT NOT NULL)
       '''
     );
  }

  Future<int> insert(Map<String, dynamic> row) async{ //id: #### unique to each person (use int)
    Database db = await instance.database; //calls Database --> creates db
    return await db.insert(_tableName, row); //returns unique ID
  }

  Future<List<Map<String, dynamic>>> queryAll() async{
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future update(Map<String, dynamic> row) async{ //update info for a specific row (ID)
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(_tableName, row, where: 'columnId = ?', whereArgs: [id]);
  }
  
  Future<int> delete(int id) async{
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs:[id]);
  }

}