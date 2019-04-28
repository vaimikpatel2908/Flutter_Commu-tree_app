import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'models/Person.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBHelper {
  static final databaseName = "CommutreeDB.db";
  static final databaseVersion = 1;

  static const String RegistrationTable = "registration";
  static const String ColumnId = "id";
  static const String ColumnImage = "image";
  static const String ColumnName = "name";
  static const String ColumnEmail = "email";
  static const String ColumnPassword = "password";
  static const String ColumnAge = "age";
  static const String ColumnPhone = "phone";
  static const String ColumnDob = "dob";
  static const String ColumnAddress = "address";
  static const String ColumnCity = "city";
  static const String ColumnMaritalStatus = "mrg_status";
  static const String ColumnProfession = "profession";
  static const String ColumnEducation = "education";

  static const String FavTableName = "Favourites";
  static const String FavColumnID = "favId";
  static const String FavColumnUserId = "userId";
  static const String FavColumnFavUserID = "favUserId";
  static const String FavColumnStatus = "status";

  DBHelper._();

  static final DBHelper dbhelper = DBHelper._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    return await openDatabase(path,
        version: databaseVersion, onCreate: _onCreate);
  }

  static const CreateRegistrationTableQuery =
      "Create Table $RegistrationTable ($ColumnId Integer primary key autoincrement, $ColumnImage Text, $ColumnName Text, $ColumnEmail Text, $ColumnAge Integer, $ColumnPhone Text, $ColumnPassword Text , $ColumnDob Text ," +
          "$ColumnAddress Text , $ColumnCity Text , $ColumnMaritalStatus Text , $ColumnProfession Text , $ColumnEducation Text)";

  static const String DeleteRegistrationTableQuery =
      "Drop Table if Exists $RegistrationTable";

  static const String CreateFavouritesTableQuery =
      "Create Table $FavTableName ( $FavColumnID Integer primary key autoincrement, $FavColumnUserId int,$FavColumnFavUserID int, $FavColumnStatus bool)";

  static const String DeleteFavouritesTableQuery =
      "Drop Table If Exists " + FavTableName;

  //execcutes on oncreate event of Database
  Future _onCreate(Database db, int version) async {
    await db.execute(CreateRegistrationTableQuery);
    await db.execute(CreateFavouritesTableQuery);
  }

  //Executes on onUngrade event on Database
  // Future _onUpgrade(Database db, int oldversion, int newVersion) async {
  //   await db.execute(DeleteRegistrationTableQuery);
  //   await db.execute(DeleteFavouritesTableQuery);
  // }

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row, String tablename) async {
    return await _database.insert(tablename, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows(String tablename) async {
    Database db = await dbhelper.database;
    return await db.query(tablename);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount(String tablename) async {
    Database db = await dbhelper.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tablename'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(
      Map<String, dynamic> row, String tablename, String idColumnName) async {
    Database db = await dbhelper.database;
    int id = row[idColumnName];
    return await db
        .update(tablename, row, where: '$idColumnName = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id, String tablename, String idColumnName) async {
    Database db = await dbhelper.database;
    return await db
        .delete(tablename, where: '$idColumnName = ?', whereArgs: [id]);
  }

  Future<Person> verifyUserByCredentials(String email, String password) async {
    Database db = await dbhelper.database;
    String query =
        "SELECT * FROM $RegistrationTable where $ColumnEmail= '$email' and $ColumnPassword= '$password'";
    final result = await db.rawQuery(query);
    if (result.length != 0) {
      print(result[0]);
      // return Person.fromJson(result);
      return Person.fromJson(result[0]);
    } else {
      return null;
    }
    // if(result != null){
    //     return result[0][columnId];
    // }
    // else{
    //   return 0;
    // }
  }

  
  Future<List<Person>> selectAllUsers(int userId) async {
    String query =
        "Select * from $RegistrationTable where $ColumnId != $userId";
    List<Person> personList = new List<Person>();

    final result = await _database.rawQuery(query);
    print(result.length);
    if (result.length != 0) {
      result.forEach((person) {
        print(person);
        personList.add(Person.fromJson(person));
      });
      return personList;
    } else {
      return null;
    }
  }

  Future<Person> getDataByUserId(int userId) async {
    String query = "Select * from $RegistrationTable where $ColumnId = $userId";

    final result = await _database.rawQuery(query);
    if (result.length != 0) {
      //need to pass data here
      Person person = Person.fromJson(result[0]);
      print(result);
      //ShowAlert("Data Verified", "Login Successfull");
      return person;
    }

    return null;
  }

  Future<bool> saveSharedPreferences(String key,int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, userId);
    print("Set shared preference");
    return prefs.commit();
  }

  Future<int> getSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt(key);
    print("got shared preference");
    return userId;
  }

  void showAlert(BuildContext context, String title, String msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Reset Dataabse
  Future resetDatabase() async {
    _database.execute(DeleteRegistrationTableQuery);
    _database.execute(DeleteFavouritesTableQuery);
    _database.execute(CreateRegistrationTableQuery);
    _database.execute(CreateFavouritesTableQuery);
    print("Database cleared");
  }

  //Seeding data for testing purpose
  void seedDataToDatabase() {
    List<Person> listOfUsers=Person.seedData();
    listOfUsers.forEach((person){
      insert(Person.toJson(person), DBHelper.RegistrationTable);
    });
    print("Data Seeded to Database");
  }
}
