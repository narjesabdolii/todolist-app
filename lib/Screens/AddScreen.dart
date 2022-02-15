import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todolist/controllers/TodoController.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  final ToDoController toDoController = Get.find();

  AddScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String text = '';
    String title = '';
    TextEditingController titleController = TextEditingController(text: title);
    TextEditingController textController = TextEditingController(text: text);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        child: Column(
          children: <Widget>[
                TextFieldCard(toDoController: titleController, maxLength: 40, hintText: "your task title?"),
                TextFieldCard(toDoController: textController, maxLength: 150, hintText: "your task description?"),
            ],
           ),
      ),

    );
  }
}

class TextFieldCard extends StatelessWidget{
  const TextFieldCard ({
    Key? key, required this.toDoController, required this.maxLength, required this.hintText,
  })  : super(key: key);
  final TextEditingController toDoController;
  final int maxLength;
  final String  hintText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:  const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: TextField(
        maxLength: maxLength,
        controller: toDoController,
        autofocus: true,
        decoration:  InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'Poppins-Regular'
        ),
      ),
    );
  }
}

