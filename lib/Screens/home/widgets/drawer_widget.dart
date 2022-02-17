import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/home_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage("lib/assets/images/List.jpg"),
                fit: BoxFit.cover,
              )
            ),
            child: Text(''),
          ),
          ListTile(
            title: const Text('Theme'),
            trailing: Get.isDarkMode
                ? const Icon(Icons.wb_sunny)
                : const Icon(Icons.nightlight_round),
            onTap: _onThemeClicked,
          ),
        ],
      ),
    );
  }

  void _onThemeClicked() {
    final HomeController homeController = Get.put(HomeController());
    homeController.switchTheme();
    Get.back();
  }
}
