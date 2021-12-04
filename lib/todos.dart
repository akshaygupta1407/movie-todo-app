import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'todo.dart';
class TodosProvider extends ChangeNotifier{

  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: "Avengers", id: '', description: 'Joe Russo',
        image: 'https://terrigen-cdn-dev.marvel.com/content/prod/1x/avengersendgame_lob_crd_05.jpg',
    ),
    Todo(createdTime: DateTime.now(), title: "Avengers1", id: '', description: 'Joe Russo',
        image: 'https://terrigen-cdn-dev.marvel.com/content/prod/1x/avengersendgame_lob_crd_05.jpg',
       ),
    Todo(createdTime: DateTime.now(), title: "Avengers2", id: '', description: 'Joe Russo',
        image: 'https://terrigen-cdn-dev.marvel.com/content/prod/1x/avengersendgame_lob_crd_05.jpg',
    ),
    Todo(createdTime: DateTime.now(), title: "Avengers3", id: '', description: 'Joe Russo',
        image: 'https://terrigen-cdn-dev.marvel.com/content/prod/1x/avengersendgame_lob_crd_05.jpg',
        ),
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