import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function onChanged;
  final Function onLongPress;

  TaskTile({
    this.isChecked,
    this.taskTitle,
    this.onChanged,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          color: Colors.black54,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: onChanged,
        activeColor: Colors.lightBlueAccent,
      ),
      onLongPress: onLongPress,
    );
  }
}
