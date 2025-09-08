import 'package:hive/hive.dart';

part 'todo.g.dart'; // Needed for code generation

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  Todo({required this.title, required this.description});
}
