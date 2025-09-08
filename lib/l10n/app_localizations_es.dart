// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get homePageTitle => 'CRUD con Hive + Riverpod';

  @override
  String get homePageEmptyMessage => 'Aún no hay tareas';

  @override
  String hiveTodosLog(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString elementos',
      one: '$countString elemento',
      zero: 'sin elementos',
    );
    return '🔍 Tareas Hive ($_temp0):';
  }

  @override
  String get printTodosTooltip => 'Imprimir tareas en la consola';

  @override
  String get editTodoTitle => 'Editar tarea';

  @override
  String get addTodoTitle => 'Añadir tarea';

  @override
  String get todoTitleLabel => 'Título';

  @override
  String get enterTitleValidator => 'Introduce un título';

  @override
  String get todoDescriptionLabel => 'Descripción';

  @override
  String get enterDescriptionValidator => 'Introduce una descripción';

  @override
  String get updateButton => 'Actualizar';

  @override
  String get addButton => 'Añadir';
}
