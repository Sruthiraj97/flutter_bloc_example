// todo_event.dart
import 'package:meta/meta.dart';

@immutable
abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String todo;
  AddTodo({required this.todo});
}

class RemoveTodo extends TodoEvent {
  final int index;
  RemoveTodo({required this.index});
}
