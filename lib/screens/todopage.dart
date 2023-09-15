import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/bloc/todo_event.dart';
import 'text_input_widget.dart';
import 'add_todo_button_widget.dart';
import 'todo_list_widget.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            MyTextInputField(controller: _todoController),
            const SizedBox(height: 16.0),
            MyAddTodoButton(
              controller: _todoController,
              onPressed: (todo) {
                todoBloc.add(AddTodo(todo: todo));
              },
            ),
            const SizedBox(height: 16.0),
            const MyTodoList(),
          ],
        ),
      ),
    );
  }
}
