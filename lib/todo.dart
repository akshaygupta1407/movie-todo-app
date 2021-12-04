import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
class TodoField{
  static const createTime = 'createdTime';
}

class Todo{
  DateTime createdTime;
  String title;
  String id;
  String description;
  String image;
   Todo({
    required this.createdTime,
     required this.title,
     required this.id,
     required this.description,
     required this.image,


});


}