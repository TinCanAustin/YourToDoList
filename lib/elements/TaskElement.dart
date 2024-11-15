import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/deviceSize.dart';

import 'package:todoapp/classes/tasksClass.dart';

class taskCard extends StatefulWidget {
  final DateTime date;
  final List<mainToDo> toDoList;
  final List<sideToDo> sideToDoList;


  const taskCard({
    super.key,
    required this.date,
    required this.toDoList,
    required this.sideToDoList
  });

  @override
  State<taskCard> createState() => _taskCardState();
}

class _taskCardState extends State<taskCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context) * 0.8,
      width: deviceWidth(context) * 0.9,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.white30)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "Tasks for ${DateFormat("dd/MM/yy").format(widget.date)}",
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: deviceHeight(context) * 0.02),

              //Change Style later
              const Text(
                "Main:"
              ),

              //Main Tasks
              if(widget.toDoList.isEmpty)
                Text("Nothing")
              else
                Padding(
                  padding: EdgeInsets.only(
                    top: deviceHeight(context) * 0.01
                  ),
                  child: Container(
                    color: Colors.white,
                    height: deviceHeight(context) * 0.3,
                    child: SingleChildScrollView(
                      child: Align(
                        widthFactor: 1.0,
                        child: Column(
                          children: widget.toDoList.map((e){
                            return Row(
                              children: [
                                Checkbox(
                                  value: e.taskStatus,
                                  onChanged: (newVal){
                                    setState(() {
                                      e.taskStatus = newVal!;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    e.task
                                  ),
                                )
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),

              SizedBox(height: deviceHeight(context) * 0.02,),
              const Text("Side:"),

              if (widget.sideToDoList.isEmpty)
                Text("No tasks at the moment")
              else
                Padding(
                  padding: EdgeInsets.only(
                      top: deviceHeight(context) * 0.01
                  ),
                  child: Container(
                    color: Colors.white,
                    height: deviceHeight(context) * 0.3,
                    child: SingleChildScrollView(
                      child: Align(
                        widthFactor: 1.0,
                        child: Column(
                          children: widget.sideToDoList.map((e){
                            return Row(
                              children: [
                                Checkbox(
                                  value: e.taskStatus,
                                  onChanged: (newVal){
                                    setState(() {
                                      e.taskStatus = newVal!;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                      e.task
                                  ),
                                )
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
