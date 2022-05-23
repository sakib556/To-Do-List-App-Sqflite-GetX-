import 'package:flutter/material.dart';
import 'package:to_do_list_app_flutter/models/todo_info.dart';

class TodoWidget extends StatelessWidget {
  final TodoInfo todo;

  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: todo.isDone,
              onChanged: (_) {},
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 19,
                    ),
                  ),
                  if (todo.description!.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        todo.description!,
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
