import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app_flutter/controllers/search_todos_controller.dart';
import 'package:to_do_list_app_flutter/views/to-do_details/to-do_details_page.dart';

class TodoSearchPage extends StatelessWidget {
  TodoSearchPage({Key? key}) : super(key: key);
  TodoSearchController controller = Get.put(TodoSearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search your todos'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'title name'),
                    onChanged: (value) {
                      controller.searchTodo(value);
                    },
                  )),
              Container(
                height: 500,
                width: 500,
                child: Obx(() {
                  return controller.searchTodos == null
                      ? Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Center(
                            child: Text(
                              'No todos match',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        )
                      : ListView.separated(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(16),
                          separatorBuilder: (context, index) =>
                              Container(height: 8),
                          itemCount: controller.searchTodos.length,
                          itemBuilder: (context, i) {
                            final todo = controller.searchTodos[i];
                            return ListTile(
                              title: Text(todo.title),
                              subtitle: Text(todo.description),
                              onTap: () {
                                Get.to(TodoDetails(todo));
                              },
                            );
                          },
                        );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
