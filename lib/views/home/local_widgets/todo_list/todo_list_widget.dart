import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app_flutter/controllers/todos_controller.dart';
import 'package:to_do_list_app_flutter/views/home/local_widgets/todo_list/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  TodoListWidget({Key? key}) : super(key: key);
  final TodosController _todosController = Get.put(TodosController());
  @override
  Widget build(BuildContext context) {
    _todosController.fetchTodos();
    return Expanded(child: Obx(() {
      return _todosController.todoList.length == null
          ? Padding(
              padding: const EdgeInsets.all(28.0),
              child: Center(
                child: Text(
                  'No todos.\nAdd your first todo to tap the (+) sign of the right bottom.',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          : ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              separatorBuilder: (context, index) => Container(height: 8),
              itemCount: _todosController.todoList.length,
              itemBuilder: (context, i) {
                return TodoWidget(_todosController.todoList[i]);
              },
            );
    }));
  }
}
