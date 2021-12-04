import 'package:flutter/material.dart';
import 'package:movietodo/todo_widget.dart';
import 'package:provider/provider.dart';
import 'todo.dart';
import 'todos.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty ? Center(child: Text('No Movies in the list',style: TextStyle(fontSize: 20),)): ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      itemCount: todos.length,
      itemBuilder: (context,index){
        final todo = todos[index];
        return TodoWidget(todo: todo,);
      },
    );
  }
}
