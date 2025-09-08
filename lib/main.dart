import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_app/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      // Set the app's title
      title: 'Hive + Riverpod CRUD',
      // Configure localization delegates
      // locale: const Locale('es'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // List the languages your app supports
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
        Locale('br'), // Brazilian Portuguese
      ],
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
