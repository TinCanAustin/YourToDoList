import 'package:flutter/material.dart';
import 'package:todoapp/pages/taskDisplay.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Your To-do List",
      initialRoute: '/',
      routes: {
        '/' : (context) => const taskDisplay(),
      },
    )
  );
}