import 'package:flutter/material.dart';
import 'package:to_do_list_app_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Card(
                elevation: 3,
                child: TaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: () {
                    taskData.deleteTask(task);
                  },
                ),
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
