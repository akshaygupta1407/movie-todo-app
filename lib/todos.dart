import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'todo.dart';
class TodosProvider extends ChangeNotifier{

  List<Todo> _todos = [
  ];
  List<Todo> get todos => _todos;
  //where((todo)=>todo.isDone==false).toList();
  void addTodo(Todo todo){
    _todos.add(todo);
    notifyListeners();
  }
  void removeTodo(Todo todo){
    _todos.remove(todo);
    notifyListeners();
  }
}
