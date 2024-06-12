class Todo {
  int? id;
  String title;

  Todo({this.id, required this.title});

  // to map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'title': title};
    //tambah juga idnya
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  // from map
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(id: map['id'], title: map['title']);
  }
}
