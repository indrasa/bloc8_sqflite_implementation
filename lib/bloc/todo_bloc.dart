import 'package:bloc/bloc.dart';
import 'package:bloc_sqflite_chatgpt/database_helper.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../todo.model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final DatabaseHelper databaseHelper;
  TodoBloc(this.databaseHelper) : super(TodoLoading()) {
    // @override
    // Stream<TodoState> mapEventToState(TodoEvent event) async* {
    //   if (event is LoadTodos) {
    //     yield TodoLoading();
    //     try {
    //       final todos = await databaseHelper.getTodos();
    //       yield TodoLoaded(todos);
    //     } catch (_) {
    //       yield TodoError();
    //     }
    //   } else if (event is AddTodo) {
    //     try {
    //       await databaseHelper.insert(event.todo);
    //       final todos = await databaseHelper.getTodos();
    //       yield TodoLoaded(todos);
    //     } catch (_) {
    //       yield TodoError();
    //     }
    //   }
    // } //ini sudah deprecated
    on<LoadTodos>(
      (event, emit) async {
        try {
          print("mencoba tuk load todos");
          final todos = await databaseHelper.getTodos();
          emit(TodoLoaded(todos));
        } catch (e) {
          print("error");
          print(e.toString());
          emit(TodoError()); //coba buat fungsi ini diluar
        }
      },
    );

    on<AddTodo>(
      (event, emit) async {
        try {
          await databaseHelper.insert(event.todo);
          final todos = await databaseHelper.getTodos();
          emit(TodoLoaded(todos));
        } catch (_) {
          emit(TodoError());
        }
      },
    );
  }
}
