class TodoInfo {
  DateTime createdTime;
  String? title;
  String? id;
  String? description;
  bool? isDone;

  TodoInfo({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
}
