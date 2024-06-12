part of 'todo_bloc.dart';

// @immutable
// sealed class TodoEvent {}

abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;

  AddTodo(this.todo);

  @override
  List<Object> get props => [todo];
}
