import 'dart:async';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper db=DBHelper._();

  // static Database _database;

  // Future<Database> get database async {
  //   if (_database != null)
  //   return _database;

  //   // if _database is null we instantiate it
  //   _database = await initDB();
  //   return _database;
  // }

  static const RegistrationTable = "registration";
  static const ColumnId = "id";
  static const ColumnImage = "image";
  static const ColumnName = "name";
  static const ColumnEmail = "email";
  static const ColumnPassword = "password";
  static const ColumnAge = "age";
  static const ColumnPhone = "phone";
  static const ColumnDob = "dob";
  static const ColumnAddress = "address";
  static const ColumnCity = "city";
  static const ColumnMaritalStatus = "mrg_status";
  static const ColumnProfession = "profession";
  static const ColumnEducation = "education";

  static const CreateRegistrationTableQuery = "Create Table " + RegistrationTable + " ( " + ColumnId + " Integer primary key autoincrement, " + ColumnImage + " int," + ColumnName + " Text," + ColumnEmail + " Text," + ColumnAge + " Integer," + ColumnPhone + " Text," + ColumnPassword + " Text ,"+ ColumnDob +" Text , "
            + ColumnAddress+" Text , "+ ColumnCity+" Text , "+ColumnMaritalStatus +" Text , "+ColumnProfession+
            " Text , "+ColumnEducation+" Text)";
 
  static void databaselog(String functionName,String sql,[ List<Map<String,dynamic>> selectQueryResult,int insertAndUpdateQueryResult]){
    print(functionName);
    print(sql);

    if(selectQueryResult != null){
      print(selectQueryResult);

    }else if(insertAndUpdateQueryResult != null){
      print(insertAndUpdateQueryResult);
    }
  }

}