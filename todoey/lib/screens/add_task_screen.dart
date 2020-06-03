import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Add Task',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 30.0,
          ),
        ),
        TextField(
          onChanged: (value) {
            newTaskTitle = value;
          },
          autofocus: true,
          cursorColor: Colors.lightBlueAccent,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.check),
            hintText: 'Enter Task',
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        FlatButton(
          onPressed: () {
            Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
            Navigator.pop(context);
          },
          child: Container(
            child: Center(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            height: 60.0,
          ),
          color: Colors.lightBlueAccent,
        ),
      ],
    );
  }
}
