import 'package:flutter/material.dart';
import 'package:to_do_list_app_flutter/views/home/local_widgets/todo_add_dialogue/todo_form_widget.dart';

class TodoAddDialgueWidget extends StatelessWidget {
  const TodoAddDialgueWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Todo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 8),
            TodoFormWidget()
          ],
        ),
      );
}
