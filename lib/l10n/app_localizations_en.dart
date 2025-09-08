// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homePageTitle => 'Hive + Riverpod CRUD';

  @override
  String get homePageEmptyMessage => 'No todos yet';

  @override
  String hiveTodosLog(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString items',
      one: '$countString item',
      zero: 'no items',
    );
    return '🔍 Hive Todos ($_temp0):';
  }

  @override
  String get printTodosTooltip => 'Print todos to console';

  @override
  String get editTodoTitle => 'Edit Todo';

  @override
  String get addTodoTitle => 'Add Todo';

  @override
  String get todoTitleLabel => 'Title';

  @override
  String get enterTitleValidator => 'Enter a title';

  @override
  String get todoDescriptionLabel => 'Description';

  @override
  String get enterDescriptionValidator => 'Enter a description';

  @override
  String get updateButton => 'Update';

  @override
  String get addButton => 'Add';
}
