import 'package:flutter/material.dart';

import 'local_widgets/todo_dialogue/add_todo_dialogue_widget.dart';
import 'local_widgets/todo_list/todo_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("To-do List"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
          child: Column(
            children: [TodoListWidget()],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AddTodoDialogueWidget(),
            barrierDismissible: false,
          ),
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}
