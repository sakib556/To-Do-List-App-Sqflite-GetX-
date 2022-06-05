import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app_flutter/controllers/todos_controller.dart';
import 'package:to_do_list_app_flutter/models/todo_info.dart';
import 'package:to_do_list_app_flutter/views/home/home_page.dart';

class TodoDetails extends StatefulWidget {
  final TodoInfo todo;
  const TodoDetails(this.todo, {Key? key}) : super(key: key);
  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  final TodosController _controller = Get.put(TodosController());
  var title, description;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text("Edit your to-do List"),
          backgroundColor: Colors.deepPurple,
        ),
        backgroundColor: Colors.blue,
        body: Container(
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
      );
    });
  }

  Widget buildCheckBox() {
    _controller.isDoneDetails.value = widget.todo.isDone;
    return Checkbox(
      activeColor: Theme.of(context).primaryColor,
      checkColor: Colors.white,
      value: _controller.isDoneDetails.value,
      onChanged: (bool? value) {
        value = value!;
        widget.todo.isDone = value;
        _controller.isDoneDetails.value = value;
        _controller.updateCheckbox(widget.todo);
      },
    );
  }

  Widget buildTitle() {
    title = widget.todo.title;
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
    description = widget.todo.description;
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
            _controller.updateTodos(TodoInfo(
                id: widget.todo.id,
                createdTime: DateTime.now(),
                title: title,
                isDone: widget.todo.isDone,
                description: description));
            Get.offAll(() => HomePage());
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
            _controller.deleteTodos(widget.todo.id);
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
