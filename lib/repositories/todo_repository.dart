import 'package:hive/hive.dart';
import '../models/todo.dart';

class TodoRepository {
  final Box<Todo> todoBox;

  TodoRepository(this.todoBox);

  List<Todo> getAll() => todoBox.values.toList();

  Future<void> add(Todo todo) async => await todoBox.add(todo);

  Future<void> update(Todo todo) async => await todo.save();

  Future<void> delete(Todo todo) async => await todo.delete();
}
