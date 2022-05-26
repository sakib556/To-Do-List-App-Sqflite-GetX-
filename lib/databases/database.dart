import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list_app_flutter/models/todo_info.dart';

class DatabaseHelper {
  Database? _db;
  String todoTable = 'todo_table';
  String colId = 'id'; //column = col
  String colCreatedTime = 'createdTime';
  String colTitle = 'title';
  String colDescription = 'description';
  String colIsDone = 'isDone';

  Future<Database?> get database async {
    _db ??= await _initDb();
    return _db;
  }

  Future<Database?> _initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "todo.db";
    final todoListDb = await openDatabase(path, version: 10,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE $todoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,"
          "$colCreatedTime TEXT,$colTitle TEXT,$colDescription TEXT,"
          "$colIsDone INTEGER )");
    });
    return todoListDb;
  }

  Future<List<TodoInfo>> getTodoList() async {
    final db = await database;
    final List<Map<String, dynamic>> items =
        await db!.query('todo_table', orderBy: 'id DESC');
    return List.generate(
        items.length,
        (i) => TodoInfo(
            id: items[i]['id'],
            createdTime: DateTime.parse(items[i]['createdTime']),
            title: items[i]['title'],
            description: items[i]['description'],
            isDone: items[i]["isDone"] == 1 ? true : false));
  }

  Future<int?> insertTodo(TodoInfo todo) async {
    Database? db = await database;
    var result = await db?.insert(todoTable, todo.toMap());
    print("databse inserted");
    return result;
  }

  Future<int?> updateTodo(TodoInfo todo) async {
    var db = await database;
    var result = await db?.update(todoTable, todo.toMap(),
        where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int?> deleteTodo(int id) async {
    int? result;
    var db = await database;
    result = await db?.rawDelete('DELETE FROM $todoTable WHERE $colId = $id');
    return result;
  }
}
