import 'package:get/get.dart';

import '../models/todo_info.dart';

class TodosController extends GetxController {
  List<TodoInfo> todos = [
    TodoInfo(
      createdTime: DateTime.now(),
      title: 'Buy Food',
      description: 'Eggs,Milk,Bread,Water',
    ),
    TodoInfo(
      createdTime: DateTime.now(),
      title: 'Plan family trip to cox\'sbazar',
      description: 'Rent some hotels, Rent a car, Pack suitcase',
    ),
    TodoInfo(
      createdTime: DateTime.now(),
      title: 'Eid shopping',
    ),
    TodoInfo(
      createdTime: DateTime.now(),
      title: 'Plan Sultan\'s birthday party',
    ),
  ];

  List<TodoInfo> get todoList =>
      todos.where((todo) => todo.isDone == false).toList();
}
