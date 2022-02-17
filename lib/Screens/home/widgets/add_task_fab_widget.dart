import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/Screens/AddScreen.dart';

class AddTaskFABWidget extends StatelessWidget {
  const AddTaskFABWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: const Icon(Icons.add),
      onPressed: () {
        Get.to(AddScreen());
      },
    );
  }
}
