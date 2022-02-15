import 'package:flutter/material.dart';
import 'package:todolist/controllers/TodoController.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  final ToDoController toDoController = Get.find();

  AddScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String text = '';
    TextEditingController textEditingController = TextEditingController(text: text);
    return Scaffold(
      body: Container(

      ),
    );
  }
}
