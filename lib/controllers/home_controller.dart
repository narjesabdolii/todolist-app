import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isDark = false.obs;

  @override
  void onReady() {
    Get.changeTheme(ThemeData.dark());
    isDark(Get.isDarkMode);
    super.onReady();
  }

  switchTheme() {
    isDark(!isDark.value);
    isDark.value
        ? Get.changeTheme(ThemeData.light())
        : Get.changeTheme(ThemeData.dark());
  }
}
