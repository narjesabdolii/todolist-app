import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todolist/controllers/TodoController.dart';
import 'package:get/get.dart';
import 'AddScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ToDoController toDoController = Get.put(ToDoController());

    return  Scaffold(
      appBar: buildAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            const DrawerHeader(
            decoration: BoxDecoration(
             color: Colors.pink,
              image: DecorationImage(
                  image: AssetImage("lib/assets/images/List.jpg"),
                  fit: BoxFit.cover,

              )
            ),
              child:Text(''),
              
            ),
            ListTile(
                  title: const Text('Theme'),
                  trailing: Get.isDarkMode ? const Icon(Icons.wb_sunny):const Icon(Icons.nightlight_round),
                  onTap: ()
                  {
                    Get.isDarkMode ?  Get.changeTheme(ThemeData.light()) : Get.changeTheme(ThemeData.dark());
                    Get.back();
                  },
                )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add),
        onPressed: (){
          Get.to(AddScreen());
        },
      ),
      body: Container(
        child: Obx(
            ()=>ListView.separated(
                itemBuilder: (context,index) =>  ListTile(
                  title: Text(
                    toDoController.todos[index].title,
                    style: (toDoController.todos[index].done) ? const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Poppins-Regular'
                    ) : const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins-Regular'
                    ),
                  ),
                  onTap: (){
                    Get.to(AddScreen());
                  },
                  leading: Checkbox(
                    checkColor: Colors.grey,
                    value: toDoController.todos[index].done,
                    onChanged: (value){
                      var changed = toDoController.todos[index];
                      changed.done = value!;
                      toDoController.todos[index] = changed;
                    },
                    activeColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right
                  ,color: Colors.grey,
                  ),
                ),
              separatorBuilder:  (_, __) => const Divider(),
              itemCount: toDoController.todos.length,
            ),
        ),
      ),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title:
          Row(
            children:  <Widget>[
              Container(
                child: const SizedBox(width: 90,),
              ),
              Container(
                  child : const Text('All',
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular'),
                  ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child:  const Text('  tasks',
                  style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 13,
                ),),
              )

            ],
          ),
    );
  }
}
