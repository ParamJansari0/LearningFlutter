import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/text_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, _) => ListView.builder(
        itemCount: taskData.tasks.length,
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.taskName,
            isChecked: task.isDone,
            onChanged: (value) {
              taskData.updateTask(task);
            },
            onLongPress: () {
              taskData.deleteTask(task);
            },
          );
        },
      ),
    );
  }
}
