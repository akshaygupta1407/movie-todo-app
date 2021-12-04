import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movietodo/todos.dart';
import 'package:movietodo/utils.dart';
import 'package:provider/provider.dart';

import 'todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({
    required this.todo,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(todo.id),
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            caption: 'Delete',
            onTap:() => deleteTodo(context, todo),
            icon: Icons.delete,
          ),
        ],
        child: buildTodo(context)),
  );

    Widget buildTodo(BuildContext context)=>  Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        CircleAvatar(radius: 30,
        backgroundImage: NetworkImage(todo.image),
        ),
        SizedBox(width: 10,
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
                if(todo.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todo.description,style: TextStyle(fontSize: 20,height: 1.5),
                    ),
                  ),

              ],
            ),
        ),
        GestureDetector(
          child: Icon(
            Icons.delete,
            color: Colors.red,
            size: 20,
          ),
          onTap:() => deleteTodo(context, todo),
        ),
      ],
    ),
  );
    void deleteTodo(BuildContext context,Todo todo)
    {
        final provider = Provider.of<TodosProvider>(context,listen: false);
        provider.removeTodo(todo);
        Utils.showSnackBar(context,"Deleted");
    }
}
