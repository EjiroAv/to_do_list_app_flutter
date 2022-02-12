import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app_flutter/models/task_data.dart';
import 'package:to_do_list_app_flutter/values.dart';
import 'package:to_do_list_app_flutter/constants.dart';

class AddTaskScreen extends StatelessWidget {
  static const String id = 'AddTaskScreen';
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Container(
      color: kAddTaskScreenGrey,
      child: Container(
        padding: kDimensionPaddingEdgeInsetAll_20,
        decoration: const BoxDecoration(
          color: kStyleColorWhite,
          borderRadius: BorderRadius.only(
            topRight: kDimensionRadiusCircular_20,
            topLeft: kDimensionRadiusCircular_20,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              kAddTaskScreenMainText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: kStyleFontSizeValue_25,
              ),
            ),
            TextField(
              controller: controller,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      kDimensionPaddingEdgeInsetsAll_15),
                  backgroundColor: MaterialStateProperty.all(kStyleColorTeal)),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(controller.text);
                Navigator.pop(context);
              },
              child: const Text(
                kAddTaskScreenButtonText,
                style: TextStyle(
                  fontSize: kStyleFontSizeValue_18,
                  color: kStyleColorWhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
