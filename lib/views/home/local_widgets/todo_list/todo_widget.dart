import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app_flutter/controllers/todos_controller.dart';
import 'package:to_do_list_app_flutter/models/todo_info.dart';

class TodoWidget extends StatelessWidget {
  final TodoInfo todo;
  TodoWidget(this.todo, {Key? key}) : super(key: key);
  final TodosController _controller = Get.put(TodosController());

  @override
  Widget build(BuildContext context) {
    _controller.isDone.value = todo.isDone;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: _controller.isDone.value,
            onChanged: (bool? value) {
              value = value!;
              todo.isDone = value;
              _controller.isDone.value = value;
              _controller.updateCheckbox(todo);
            },
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontSize: 19,
                  ),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todo.description,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
