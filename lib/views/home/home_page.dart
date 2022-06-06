import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app_flutter/views/to-do_search/todo_search_page.dart';

import 'local_widgets/todo_add_dialogue/todo_add_dialogue_widget.dart';
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
            children: [
              TodoListWidget(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, bottom: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      heroTag: "search",
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Get.to(TodoSearchPage());
                      },
                      child: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "dialogue",
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => TodoAddDialgueWidget(),
                        barrierDismissible: false,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
