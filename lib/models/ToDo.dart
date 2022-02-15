import 'package:flutter/material.dart';

class ToDo{
  String title;
  String text;
  bool done;
  ToDo({
  required this.text,
    required this.done,
    required this.title,
  });
}