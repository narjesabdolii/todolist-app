import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/Screens/Home.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      theme: ThemeData(fontFamily: "Poppins-Regular"),
      home: const HomeScreen(),
    );
  }
}
