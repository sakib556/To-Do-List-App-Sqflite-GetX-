import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app_flutter/controllers/todos_controller.dart';
import 'package:to_do_list_app_flutter/models/todo_info.dart';

class TodoFormWidget extends StatelessWidget {
  final TodosController _todosController = Get.put(TodosController());
  TodoFormWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context);
    print("screeen size : ${screenWidth}");
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          SizedBox(height: 8),
          buildDescription(),
          SizedBox(height: 32),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildCancelButton(context),
              SizedBox(width: 30),
              buildSaveButton(context),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        controller: _todosController.titleController,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        controller: _todosController.descriptionController,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildSaveButton(BuildContext context) => SizedBox(
        width: 100,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
          ),
          onPressed: () {
            String title = _todosController.titleController.text;
            String description = _todosController.descriptionController.text;
            _todosController.insertTodos(TodoInfo(
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
        width: 100,
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
}
