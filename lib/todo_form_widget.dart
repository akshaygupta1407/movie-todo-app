import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final String Image;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedImage;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    this.Image = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedImage,
    required this.onSavedTodo,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 8,),
        buildDescription(),
        SizedBox(height: 8,),
        buildImage(),
        SizedBox(height: 8,),
        buildButton(),
      ],
    ),
  );
  Widget buildTitle()=> TextFormField(
    initialValue: title,
    onChanged: onChangedTitle,
    validator: (title){
      if(title!.isEmpty)
        {
          return "The title cannot be empty";
        }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Movie Title',
    ),
  );
  Widget buildDescription()=> TextFormField(
    initialValue: description,
    onChanged: onChangedDescription,
    validator: (description){
      if(description!.isEmpty)
      {
        return "The Director Field cannot be empty";
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Director Name',
    ),
  );
  Widget buildImage()=> TextFormField(
    initialValue: Image,
    onChanged: onChangedImage,
    validator: (Image){
      if(Image!.isEmpty)
      {
        return "The Image Link Field cannot be empty";
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Image Link',
    ),
  );
  Widget buildButton()=> SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
      ),
      onPressed: onSavedTodo,
      child: Text("Save"),
    ),
  );
}
