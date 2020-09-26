import 'package:crussqlite/SharedPreferenced/SessionManager.dart';
import 'package:crussqlite/models/ModelAdmin.dart';
import 'package:crussqlite/models/ModelMahasiswa.dart';
import 'package:crussqlite/ui/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'package:toast/toast.dart';

class DatabaseHelper {
  SharedPreference session = new SharedPreference();
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  final String tableadmin = 'tbadmin';
  final String tablemhs = 'tbmhs';
  final String columId = 'id';
  final String columnUsername = 'username';
  final String columnFirstName = 'firstname';
  final String columnLastName = 'lastname';
  final String columnMobileNo = 'mobileno';
  final String columnEmailId = 'emailid';
  final String columnPassword = 'password';
  final String columnNIM = 'NIM';
  final String columnJurusan = 'jurusan';
  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'dbuniv.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int NewViersion) async {
    await db.execute(
        'CREATE TABLE $tableadmin($columnUsername TEXT PRIMARY KEY, $columnFirstName TEXT, $columnLastName TEXT,$columnMobileNo TEXT, $columnEmailId TEXT,$columnPassword Text)');
    await db.execute(
        'CREATE TABLE $tablemhs($columnNIM TEXT PRIMARY KEY, $columnFirstName TEXT, $columnLastName TEXT,$columnMobileNo TEXT, $columnEmailId TEXT,$columnJurusan Text)');
  }

//register
  Future<int> saveAdmin(ModelAdmin admin) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableadmin, admin.toMap());
    return result;
  }

  //login
  Future<ModelAdmin> doLogin(
      BuildContext context, String username, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM $tableadmin WHERE $columnUsername = '$username' and $columnPassword = '$password'");

    if (res.length == 1) {
      var d = ModelAdmin.fromMap(res.first);
      var usernamedb = d.username;
      var emaildb = d.emailid;
      var mobilenodb = d.mobileno;
      var firtsnamedb = d.firstname;
      var lastnamedb = d.lastname;
      var value = 1;

      session.saveData(
          value, usernamedb, firtsnamedb, lastnamedb, emaildb, mobilenodb);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
        ModalRoute.withName('/LoginScreen'),
      );
      Toast.show("Berhasil mekalkukan Login", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else {
      Toast.show("Periksa lagi username dan password anda", context,
          duration: 5, gravity: Toast.BOTTOM);
    }
  }

  //Menyimpan data mahasiswa
  Future<int> saveMhs(ModelMahasiswa mhs) async {
    var dbClient = await db;
    var result = await dbClient.insert(tablemhs, mhs.toMap());
    return result;
  }

//Get All Pegawai
  Future<List> getAllMhs() async {
    var dbClient = await db;
    var result = await dbClient.query(tablemhs, columns: [
      columnNIM,
      columnFirstName,
      columnLastName,
      columnMobileNo,
      columnEmailId,
      columnJurusan
    ]);
    return result.toList();
  }

//Update mahasiswa
  Future<int> updateMhs(ModelMahasiswa mhs) async {
    var dbClient = await db;
    return await dbClient.update(tablemhs, mhs.toMap(),
        where: "$columnNIM = ?", whereArgs: [mhs.NIM]);
  }

//Delete Mahasiswa
  Future<int> deleteMhs(String nim) async {
    var dbClient = await db;
    return await dbClient
        .delete(tablemhs, where: "$columnNIM = ?", whereArgs: [nim]);
  }
}
