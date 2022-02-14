import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(),
     backgroundColor: Colors.grey[900],

    );
  }
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text('All Tasks',
      style: TextStyle(
        fontFamily: 'Poppins',
      ),),
      backgroundColor: Colors.grey[900],
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    );
  }
}
