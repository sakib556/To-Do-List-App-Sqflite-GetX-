import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app_flutter/databases/database.dart';
import 'package:to_do_list_app_flutter/models/todo_info.dart';

class TodosController extends GetxController {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var database = DatabaseHelper();
  var todoList = <TodoInfo>[].obs;

  fetchTodos() async {
    var todos = await database.getTodoList();
    if (todos != null) {
      todoList.value = todos;
    }
    todoList.refresh();
  }

  insertTodos(TodoInfo todo) async {
    await database.insertTodo(todo);
    fetchTodos();
  }
}
