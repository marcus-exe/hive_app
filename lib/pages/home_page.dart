// pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/l10n/app_localizations.dart'; // Add this import
import '../models/todo.dart';
import '../providers/todo_provider.dart';
import 'todo_form_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void _printAllTodos(BuildContext context) {
    final box = Hive.box<Todo>('todos');
    final l10n = AppLocalizations.of(context)!; // Get localization instance
    print(l10n.hiveTodosLog(box.length)); // Use a localized string with a parameter
    for (int i = 0; i < box.length; i++) {
      final todo = box.getAt(i);
      print('[$i] Title: ${todo?.title}, Description: ${todo?.description}');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!; // Get localization instance
    final todos = ref.watch(todoListProvider);
    final todoNotifier = ref.read(todoListProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.homePageTitle)), // Use localized title
      body: todos.isEmpty
          ? Center(child: Text(l10n.homePageEmptyMessage)) // Use localized empty message
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
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
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'print',
            backgroundColor: Colors.grey,
            child: const Icon(Icons.bug_report),
            onPressed: () => _printAllTodos(context), // Pass context to the method
            tooltip: l10n.printTodosTooltip, // Use localized tooltip
          ),
        ],
      ),
    );
  }
}