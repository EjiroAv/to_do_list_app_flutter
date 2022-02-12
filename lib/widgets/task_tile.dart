import 'package:flutter/material.dart';
import 'package:to_do_list_app_flutter/constants.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?)? checkboxCallback;
  final void Function()? longPressCallback;

  const TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            color: isChecked ? kStyleColorBlack_26 : kStyleColorBlack,
            fontWeight: FontWeight.w300),
      ),
      leading: Checkbox(
        activeColor: kStyleColorBlack_26,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
