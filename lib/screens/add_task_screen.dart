import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  static const String id = 'AddTaskScreen';
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            TextField(
              controller: controller,
              //TODO: Change the color to the Same color as the yellow
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
                  backgroundColor: MaterialStateProperty.all(Colors.teal)),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(controller.text);
                Navigator.pop(context);
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
