class TodoInfo {
  String? title;
  String? id;
  String? description;
  bool? isDone;

  TodoInfo({
    required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
}
