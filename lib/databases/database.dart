import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list_app_flutter/models/todo_info.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db = null;

  DatabaseHelper._instance();
  String? todoTable;
  String? colId; //column = col
  String? colCreatedTime;
  String? colTitle;
  String? colDescription;
  String? colIsDone;

  Future<Database?> get db async {
    _db ??= await _initDb();
    return _db;
  }

  Future<Database?> _initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'todo_list.db';
    final todoListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $todoTable($colId INTEGER PRIMARY KEY, $colCreatedTime TEXT, $colTitle TEXT, $colDescription TEXT,$colIsDone TEXT )");
  }

  Future<List<Map<String, dynamic>>> getTodoMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(todoTable!);
    return result;
  }

  Future<List<TodoInfo>> getTodoList() async {
    final List<Map<String, dynamic>> todoMapList = await getTodoMapList();
    final List<TodoInfo> todoList = [];
    todoMapList.forEach((todoMap) {
      todoList.add(TodoInfo.fromMap(todoMap));
    });
    todoList.sort(
        (todoA, todoB) => todoA.createdTime!.compareTo(todoB.createdTime!));
    return todoList;
  }

  Future<int?> insertTodo(TodoInfo todo) async {
    Database? db = await this.db;
    var result = await db?.insert(todoTable!, todo.toMap());
    return result;
  }

  Future<int?> updateTodo(TodoInfo todo) async {
    var db = await this.db;
    var result = await db?.update(todoTable!, todo.toMap(),
        where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int?> deleteTodo(int id) async {
    int? result;
    var db = await this.db;
    result = await db?.rawDelete('DELETE FROM $todoTable WHERE $colId = $id');
    return result;
  }
}
