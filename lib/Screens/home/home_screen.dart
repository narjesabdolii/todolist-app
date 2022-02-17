import 'package:flutter/material.dart';
import 'package:todolist/Screens/home/widgets/add_task_fab_widget.dart';
import 'package:todolist/controllers/TodoController.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/home_controller.dart';

import '../AddScreen.dart';
import 'widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Obx(() {
      final isDark = homeController.isDark.value;
      final backgroundColor = isDark ? Colors.white : Colors.grey[800];
      final foregroundColor = !isDark ? Colors.white : Colors.grey[800];
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          centerTitle: true,
          title: const Text(
            'All Tasks',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppin'
                  's-Regular'
            ),
          ),
        ),
        drawer: const DrawerWidget(),
        floatingActionButton: const AddTaskFABWidget(),
        body: _Body(),
      );
    });
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ToDoController toDoController = Get.put(ToDoController());

    return Obx(() => ListView.separated(
      itemBuilder: (context, index) => ListTile(
        title: Text(
          toDoController.todos[index].title,
          style: (toDoController.todos[index].done)
              ? const TextStyle(color: Colors.grey)
              : const TextStyle(color: Colors.white),
        ),
        onTap: () {
          Get.to(AddScreen());
        },
        leading: Checkbox(
          checkColor: Colors.grey,
          value: toDoController.todos[index].done,
          onChanged: (value) {
            var changed = toDoController.todos[index];
            changed.done = value!;
            toDoController.todos[index] = changed;
          },
          activeColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: toDoController.todos.length,
    ));
  }
}
