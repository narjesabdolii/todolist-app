import 'package:flutter/material.dart';
import 'package:todolist/controllers/home_controller.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

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
          title: Container(
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "search",
                //border: InputBorder.none,
              ),
            ),
          ),
        ),

      );
    }
    );
  }
}
