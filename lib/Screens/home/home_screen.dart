import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todolist/Screens/AddScreen.dart';
import 'package:todolist/Screens/home/widgets/add_task_fab_widget.dart';
import 'package:todolist/controllers/TodoController.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/home_controller.dart';

import '../AddScreen.dart';
import 'SearchBar.dart';
import 'widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Obx(() {
      final isDark = homeController.isDark.value;
      final backgroundColor = isDark ? Colors.white : Colors.grey[900];
      final foregroundColor = !isDark ? Colors.white : Colors.grey[900];
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
          actions:  <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Get.to(const SearchBar());
              },
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("lib/assets/images/1.png"),
            )
          ],
        ),

        drawer: const DrawerWidget(),
        floatingActionButton: const AddTaskFABWidget(),
        body: const _Body()
      );
    });
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ToDoController toDoController = Get.put(ToDoController());

    return Obx(() =>
            ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  toDoController.todos[index].title,
                  style: (toDoController.todos[index].done)
                      ? const TextStyle(color: Colors.grey)
                      : null,
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

                trailing: Wrap(
                  spacing: 12, // space between two icons
                  children:  <Widget>[
                    Icon(Icons.alarm,
                    color: (toDoController.todos[index].done) ? Colors.grey : null,),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: toDoController.todos.length,
            ));
  }
}
