import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app_flutter/controllers/todos_controller.dart';
import 'package:to_do_list_app_flutter/models/todo_info.dart';

class TodoDetails extends StatelessWidget {
  final TodoInfo todo;
  TodoDetails(this.todo, {Key? key}) : super(key: key);
  final TodosController _todosController = Get.put(TodosController());
  var title, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit your to-do List"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildCheckBox(),
                  SizedBox(height: 8),
                  buildTitle(),
                  SizedBox(height: 8),
                  buildDescription(),
                  SizedBox(height: 32),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildCancelButton(context),
                      SizedBox(width: 30),
                      buildDeleteButton(context),
                      SizedBox(width: 30),
                      buildSaveButton(context),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCheckBox() {
    _todosController.isDone.value = todo.isDone;
    return Obx(() {
      return Checkbox(
        activeColor: Colors.blue,
        checkColor: Colors.white,
        value: _todosController.isDone.value,
        onChanged: (bool? value) {
          value = value!;
          todo.isDone = value;
          _todosController.isDone.value = value;
          _todosController.updateCheckbox(todo);
        },
      );
    });
  }

  Widget buildTitle() {
    title = todo.title;
    return TextFormField(
      initialValue: title,
      onChanged: (value) {
        title = value;
      },
      validator: (title) {
        if (title!.isEmpty) {
          return 'The title cannot be empty';
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Title',
      ),
    );
  }

  Widget buildDescription() {
    description = todo.description;
    return TextFormField(
      maxLines: 3,
      initialValue: description,
      onChanged: (value) {
        description = value;
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Description',
      ),
    );
  }

  Widget buildSaveButton(BuildContext context) => SizedBox(
        width: 80,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
          ),
          onPressed: () {
            _todosController.updateTodos(TodoInfo(
                id: todo.id,
                createdTime: DateTime.now(),
                title: title,
                isDone: false,
                description: description));
            Navigator.pop(context);
          },
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
  Widget buildCancelButton(BuildContext context) => SizedBox(
        width: 80,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
  Widget buildDeleteButton(BuildContext context) => SizedBox(
        width: 80,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () {
            _todosController.deleteTodos(todo.id);
            Navigator.pop(context);
          },
          child: Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
}
