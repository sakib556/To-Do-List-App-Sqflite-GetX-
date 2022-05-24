import 'package:flutter/material.dart';

import 'todo_form_widget.dart';

class AddTodoDialogueWidget extends StatelessWidget {
  AddTodoDialogueWidget({Key? key}) : super(key: key);
  String title = '';
  String description = '';

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
            TodoFormWidget(),
          ],
        ),
      );
}
