import 'package:flutter/material.dart';
import 'package:todoapp/elements/TaskElement.dart';

//test
import 'package:todoapp/classes/tasksClass.dart';

class taskDisplay extends StatefulWidget {
  const taskDisplay({super.key});

  @override
  State<taskDisplay> createState() => _taskDisplayState();
}

class _taskDisplayState extends State<taskDisplay> {

  List<mainToDo> tasks = [
    mainToDo(task: "Sell Crack"),
    mainToDo(task: "Dont kill yourself"),
    mainToDo(task: "Discover the meaning of life"),
    mainToDo(task: "Kiss da homies goodnight"),
    mainToDo(task: "Eat a jar of maynoisss"),
    mainToDo(task: "Call the mother"),
    mainToDo(task: "Write an essay on why is it the it of the is"),
    mainToDo(task: "Eat banana"),
  ];

  List<sideToDo> sideTasks = [
    sideToDo(task: "Jake off"),
    sideToDo(task: "Get a girlfriend"),
    sideToDo(task: "Get a boyfriend?"),
    sideToDo(task: "Eat sweet ballz")
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                "Your To-Do List",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                itemCount: 2,
                onPageChanged: (page){
                  setState(() {});
                },
                itemBuilder: (context, index){
                  return taskCard(date: DateTime.now(), toDoList: tasks, sideToDoList: sideTasks,);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
