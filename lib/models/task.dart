class Task {
  late final String name;
  late bool isDone;

  Task({required this.name, this.isDone = false});

  Map<String, dynamic> toJson() {
    return {'name': name, 'isDone': isDone};
  }

  // Map<String, List<dynamic>> toJson() {
  //   return {'name': name, 'isDone': isDone};
  // }
  //
  // Task.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   isDone = json['isDone'];
  // }

  factory Task.fromJson(Map json) {
    return Task(name: json['name'], isDone: json['isDone']);
  }

  void toggleDone() {
    isDone = !isDone;
  }
}
