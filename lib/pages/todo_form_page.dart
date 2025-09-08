import 'package:flutter/material.dart';
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

        Navigator.pop(context, widget.todo); // ✅ pass the same object back
      } else {
        // Creating new
        final newTodo = Todo(title: title, description: description);
        Navigator.pop(context, newTodo);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final isEditing = widget.todo != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Todo' : 'Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: title,
                decoration: const InputDecoration(labelText: 'Title'),
                onSaved: (val) => title = val ?? '',
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter a title' : null,
              ),
              TextFormField(
                initialValue: description,
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (val) => description = val ?? '',
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter a description' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text(isEditing ? 'Update' : 'Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
