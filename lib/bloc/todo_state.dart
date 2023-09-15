// todo_state.dart
import 'package:meta/meta.dart';

@immutable
abstract class TodoState {}

class InitialTodoState extends TodoState {}

class TodosLoaded extends TodoState {
  final List<String> todos;
  TodosLoaded({required this.todos});
}
