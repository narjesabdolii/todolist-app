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
      title:
          Row(
            children:  <Widget>[
              Container(
                child: SizedBox(width: 90,),
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
      backgroundColor: Colors.grey[900],
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    );
  }
}
