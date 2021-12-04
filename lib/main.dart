import 'package:flutter/material.dart';
import 'package:movietodo/todos.dart';
import 'package:provider/provider.dart';
import 'home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        title: 'Movie Todo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Home(),
      ),
    );
  }
}
