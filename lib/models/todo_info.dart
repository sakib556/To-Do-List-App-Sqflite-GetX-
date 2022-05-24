class TodoInfo {
  DateTime? createdTime;
  String? title;
  String? id;
  String? description;
  bool? isDone;

  TodoInfo({
    this.id,
    this.createdTime,
    this.title,
    this.description = '',
    this.isDone = false,
  });

  TodoInfo.withId(
      {this.id, this.createdTime, this.title, this.description, this.isDone});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['date'] = createdTime?.toIso8601String();
    map['title'] = title;
    map['description'] = description;
    map['isdone'] = isDone.toString();
    return map;
  }

  factory TodoInfo.fromMap(Map<String, dynamic> map) {
    return TodoInfo.withId(
        id: map['id'],
        createdTime: map['date'],
        title: map['title'],
        description: map['description'],
        isDone: map['isdone']);
  }
}
