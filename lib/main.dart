import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/todo.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive + Riverpod CRUD',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}

void printAllTodos() {
  final box = Hive.box<Todo>('todos');

  print('🔍 Hive Todos (${box.length} items):');
  for (int i = 0; i < box.length; i++) {
    final todo = box.getAt(i);
    print('[$i] Title: ${todo?.title}, Description: ${todo?.description}');
  }
}
