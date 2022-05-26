class TodoInfo {
  final int? id;
  final DateTime createdTime;
  final String title;
  final String description;
  bool isDone;

  TodoInfo({
    this.id,
    required this.createdTime,
    required this.title,
    this.description = "",
    required this.isDone,
  });

  TodoInfo.withId(
      {this.id,
      required this.createdTime,
      required this.title,
      this.description = "",
      required this.isDone});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['createdTime'] = createdTime.toString();
    map['title'] = title;
    map['description'] = description;
    map['isDone'] = isDone ? 1 : 0;
    return map;
  }

  factory TodoInfo.fromMap(Map<String, dynamic> map) {
    return TodoInfo.withId(
        id: map['id'],
        createdTime: map['createdTime'],
        title: map['title'],
        description: map['description'],
        isDone: map['isDone']);
  }
}
