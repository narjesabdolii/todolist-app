import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(),
     backgroundColor: Colors.black12,

    );
  }
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black12,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    );
  }
}
