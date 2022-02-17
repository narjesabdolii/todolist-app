import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/Screens/Home.dart';
void main() {
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
    home: const HomeScreen(),
  ));
}

