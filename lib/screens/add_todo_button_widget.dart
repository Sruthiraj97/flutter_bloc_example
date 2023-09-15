import 'package:flutter/material.dart';

class MyAddTodoButton extends StatelessWidget {
  final TextEditingController controller;
  final Function onPressed;

  const MyAddTodoButton(
      {super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final todo = controller.text;
        if (todo.isNotEmpty) {
          onPressed(todo);
          controller.clear();
        }
      },
      child: const Text('Add TODO'),
    );
  }
}
