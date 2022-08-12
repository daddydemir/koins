
import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/my_coins.dart';

class DatabaseHelper{
  Database? db;

  Future<Database?> get DB async {
    db ??= await initializeDB();
    return db;
  } 

  Future<Database> initializeDB() async{
    String dbPath = join(await getDatabasesPath() , "koins.db");
    var temp = await openDatabase(dbPath , version:1 , onCreate: CreateDb);
    return temp;
  }

  FutureOr<void> CreateDb(Database db, int version) async{
    await db.execute(
      "create table Coins(id text, name text, units  real )"
    );
  }

  Future<List<MyCoins>> GetAll() async{
    var db = await DB;
    var result = await db?.query("Coins");
    return List.generate(result!.length ,  (i) {
      return MyCoins.fromObject(result[i]);
    });
  }

  Future Insert(MyCoins coin) async {
    var db = await DB;
    String insert = "Insert into Coins (id , name , units) values (?,?,?)";
    var result = await db?.rawInsert( insert,  [coin.id, coin.name, coin.units]);
    return result;
  }

  Future Update(MyCoins coin , String data) async {
    var db = await DB;
    String update = "Update Coins set id = ? , name = ? , units = ? where id = ?";
    var result = await db?.rawUpdate(update , [coin.id , coin.name, coin.units , data]);
    return result;
  }

  Future Delete(String coinId) async {
    var db = await DB;
    var result = await db?.rawDelete("delete from Coins where id = ?" , [coinId]);
    return result;
  }
}