import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';
import 'todo_form_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    final todoNotifier = ref.read(todoListProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Hive + Riverpod CRUD')),
      body: todos.isEmpty
          ? const Center(child: Text('No todos yet'))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (_, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  onTap: () async {
                    final updatedTodo = await Navigator.push<Todo>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TodoFormPage(todo: todo),
                      ),
                    );
                    if (updatedTodo != null) {
                      todoNotifier.update(updatedTodo);
                    }
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => todoNotifier.delete(todo),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final newTodo = await Navigator.push<Todo>(
            context,
            MaterialPageRoute(
              builder: (_) => const TodoFormPage(),
            ),
          );
          if (newTodo != null) {
            todoNotifier.add(newTodo);
          }
        },
      ),
    );
  }
}
