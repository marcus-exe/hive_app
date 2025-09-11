// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_app/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'models/todo.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');
  // final appDir = await getApplicationDocumentsDirectory();
  // print('Hive DB path: ${appDir.path}');
  runApp(const ProviderScope(child: MyAppRoot()));
}

class MyAppRoot extends StatelessWidget {
  const MyAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive + Riverpod CRUD',
      theme: ThemeData(primarySwatch: Colors.indigo),
      
      // Add the localizations delegates
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      
      // Use the localeResolutionCallback to handle locale matching
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null) {
          final supportedLanguage = supportedLocales.firstWhere(
            (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
            orElse: () => supportedLocales.first,
          );
          return supportedLanguage;
        }
        return supportedLocales.first;
      },
      home: const HomePage(),
    );
  }
}