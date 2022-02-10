import 'package:flutter/material.dart';
import 'package:to_do_list_app_flutter/widgets/help_widget.dart';

class HelpScreen extends StatelessWidget {
  static const String id = 'HelpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HelpWidget(
                title: 'Add Task',
                content:
                    'To Add Task Click the + Button in the Task Screen, Input your new Task, and Click the Add Button',
              ),
              SizedBox(
                height: 10.0,
              ),
              HelpWidget(
                  title: 'Delete Task',
                  content: 'Long Press/Hold down on the task to delete'),
              SizedBox(
                height: 10.0,
              ),
              HelpWidget(
                  title: 'Clear Tasks',
                  content:
                      'To clear all the task in a certain collection ,Hold the Task in the Collections Screen and select yes'),
              SizedBox(
                height: 10.0,
              ),
              HelpWidget(
                  title: 'UpdateTask',
                  content:
                      'To clear all the task in a certain collection Hold the Task in the Collections Screen and select yes'),
              SizedBox(
                height: 50.0,
              ),
              HelpWidget(
                  title: 'Reset App',
                  content: 'To Reset The App clear data from Settings'),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text('Built by Ejiro Avwerhota : Github @EjiroAvw'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
