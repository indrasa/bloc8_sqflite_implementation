import 'package:bloc_sqflite_chatgpt/bloc/todo_bloc.dart';
import 'package:bloc_sqflite_chatgpt/database_helper.dart';
import 'package:bloc_sqflite_chatgpt/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(DatabaseHelper())..add(LoadTodos()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter SQFLite Bloc by ChatGPT',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TodoScreen(),
      ),
    );
  }
}
