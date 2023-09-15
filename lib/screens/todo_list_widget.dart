import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/bloc/todo_event.dart';
import 'package:todo_app/bloc/todo_state.dart';

class MyTodoList extends StatelessWidget {
  const MyTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is InitialTodoState) {
          return const Text('Your TODO list is empty.');
        } else if (state is TodosLoaded) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(state.todos[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        BlocProvider.of<TodoBloc>(context)
                            .add(RemoveTodo(index: index));
                        _showSnackBar(
                            context, ' ${state.todos[index]} deleted');
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  }
}
