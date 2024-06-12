import 'package:bloc_sqflite_chatgpt/bloc/todo_bloc.dart';
import 'package:bloc_sqflite_chatgpt/todo.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List Bloc SQFlite'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: 'Enter Todo', border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                final todo = Todo(title: _controller.text);
                BlocProvider.of<TodoBloc>(context).add(AddTodo(todo));
                _controller.clear();
              },
              child: const Text("Add Todo")),
          Expanded(child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodoLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TodoLoaded) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(state.todos[index].title));
                  },
                );
              } else {
                return const Center(
                  child: Text('Gagal memuat todo'),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
