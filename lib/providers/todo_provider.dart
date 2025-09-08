import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../models/todo.dart';
import '../repositories/todo_repository.dart';

// Initialize Hive Box
final hiveBoxProvider = Provider<Box<Todo>>((ref) {
  return Hive.box<Todo>('todos');
});

// Repository Provider
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final box = ref.watch(hiveBoxProvider);
  return TodoRepository(box);
});

// StateNotifier for managing list of todos
final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return TodoListNotifier(repository);
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  final TodoRepository repository;

  TodoListNotifier(this.repository) : super(repository.getAll());

  void add(Todo todo) {
    repository.add(todo);
    state = repository.getAll();
  }

  void update(Todo todo) {
    repository.update(todo);
    state = repository.getAll();
  }

  void delete(Todo todo) {
    repository.delete(todo);
    state = repository.getAll();
  }
}
