// pages/todo_form_page.dart

import 'package:flutter/material.dart';
import 'package:hive_app/l10n/app_localizations.dart'; // Add this import
import '../models/todo.dart';

class TodoFormPage extends StatefulWidget {
  final Todo? todo;

  const TodoFormPage({super.key, this.todo});

  @override
  State<TodoFormPage> createState() => _TodoFormPageState();
}

class _TodoFormPageState extends State<TodoFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();
    title = widget.todo?.title ?? '';
    description = widget.todo?.description ?? '';
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (widget.todo != null) {
        // Editing existing
        widget.todo!
          ..title = title
          ..description = description;

        Navigator.pop(context, widget.todo);
      } else {
        // Creating new
        final newTodo = Todo(title: title, description: description);
        Navigator.pop(context, newTodo);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; // Get localization instance
    final isEditing = widget.todo != null;

    return Scaffold(
      appBar: AppBar(
        // Use localized titles based on editing state
        title: Text(isEditing ? l10n.editTodoTitle : l10n.addTodoTitle)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: title,
                // Use localized label
                decoration: InputDecoration(labelText: l10n.todoTitleLabel), 
                onSaved: (val) => title = val ?? '',
                // Use localized validator message
                validator: (val) => val == null || val.isEmpty ? l10n.enterTitleValidator : null, 
              ),
              TextFormField(
                initialValue: description,
                // Use localized label
                decoration: InputDecoration(labelText: l10n.todoDescriptionLabel), 
                onSaved: (val) => description = val ?? '',
                // Use localized validator message
                validator: (val) => val == null || val.isEmpty ? l10n.enterDescriptionValidator : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text(isEditing ? l10n.updateButton : l10n.addButton), // Use localized button text
              )
            ],
          ),
        ),
      ),
    );
  }
}