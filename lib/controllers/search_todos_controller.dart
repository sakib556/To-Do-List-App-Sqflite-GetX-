import 'package:get/get.dart';
import 'package:to_do_list_app_flutter/controllers/todos_controller.dart';
import 'package:to_do_list_app_flutter/models/todo_info.dart';

class TodoSearchController extends GetxController {
  final TodosController _todosController = Get.put(TodosController());
  var searchTodos = <TodoInfo>[].obs;
  var allTodos = <TodoInfo>[];

  searchTodo(String keyword) {
    final value = allTodos;
    final todos = value.where((todo) {
      final todoTitle = todo.title.toLowerCase();
      final input = keyword.toLowerCase();
      return todoTitle.contains(input);
    }).toList();
    searchTodos.value = todos;
  }

  @override
  void onInit() {
    super.onInit();
    allTodos = _todosController.todoList;
    searchTodos.value = allTodos;
  }
}
