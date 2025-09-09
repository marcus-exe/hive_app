// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get homePageTitle => 'CRUD com Hive + Riverpod';

  @override
  String get homePageEmptyMessage => 'Nenhuma tarefa ainda';

  @override
  String hiveTodosLog(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString itens',
      one: '$countString item',
      zero: 'nenhum item',
    );
    return '🔍 Tarefas Hive ($_temp0):';
  }

  @override
  String get printTodosTooltip => 'Imprimir tarefas no console';

  @override
  String get editTodoTitle => 'Editar tarefa';

  @override
  String get addTodoTitle => 'Adicionar tarefa';

  @override
  String get todoTitleLabel => 'Título';

  @override
  String get enterTitleValidator => 'Insira um título';

  @override
  String get todoDescriptionLabel => 'Descrição';

  @override
  String get enterDescriptionValidator => 'Insira uma descrição';

  @override
  String get updateButton => 'Atualizar';

  @override
  String get addButton => 'Adicionar';
}
