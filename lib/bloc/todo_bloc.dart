// todo_bloc.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'todo_event.dart'; // Import the event file
import 'todo_state.dart'; // Import the state file

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(InitialTodoState());

  final List<String> _todos = [];

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AddTodo) {
      _todos.add(event.todo);
      yield TodosLoaded(todos: List.from(_todos));
    } else if (event is RemoveTodo) {
      if (event.index >= 0 && event.index < _todos.length) {
        _todos.removeAt(event.index);
        yield TodosLoaded(todos: List.from(_todos));
      }
    }
  }
}
