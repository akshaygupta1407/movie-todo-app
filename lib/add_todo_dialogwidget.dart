import 'package:flutter/material.dart';
import 'package:movietodo/todo.dart';
import 'package:movietodo/todo_form_widget.dart';
import 'package:movietodo/todos.dart';
import 'package:provider/provider.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";
  String Image = "";

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add To Watch Movie",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8,),
          TodoFormWidget(
            onChangedTitle: (title) => setState(()=> this.title = title),
            onChangedDescription:(description) => setState(()=> this.description = description),
            onChangedImage:(Image) => setState(()=> this.Image = Image),
            onSavedTodo : addTodo,
          ),
        ],
      ),
    ),
  );

  void addTodo(){
      final isValid = _formKey.currentState!.validate();
      if(!isValid)
        {
          return;
        }
      else
        {
          final todo = Todo(
            id: DateTime.now().toString(),
            title: title,
            description: description,
            image: Image,
            createdTime: DateTime.now(),

          );
          final provider = Provider.of<TodosProvider>(context,listen : false);
          provider.addTodo(todo);
          Navigator.of(context).pop();

        }
  }
}
