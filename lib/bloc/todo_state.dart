part of 'todo_bloc.dart';

// @immutable
// sealed class TodoState {}

// final class TodoInitial extends TodoState {}

abstract class TodoState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);

  @override
  // TODO: implement props
  List<Object> get props => [todos];
}

class TodoError extends TodoState {}
