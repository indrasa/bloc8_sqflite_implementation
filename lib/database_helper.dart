import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'todo.model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  // get database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // init database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'todo_database');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // on create
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      title TEXT)

    ''');
  }

  // insert
  Future<int> insert(Todo todo) async {
    Database db = await database;
    return await db.insert('todos', todo.toMap());
  }

  // getall todos
  Future<List<Todo>> getTodos() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(
      maps.length,
      (index) {
        return Todo.fromMap(maps[index]);
      },
    );
  }
}
