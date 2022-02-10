import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app_flutter/screens/add_task_screen.dart';
import 'package:to_do_list_app_flutter/models/task_data.dart';
import 'package:to_do_list_app_flutter/screens/help_screen.dart';
import 'package:to_do_list_app_flutter/widgets/no_task_widget.dart';
import 'package:to_do_list_app_flutter/widgets/task_list.dart';
import 'package:to_do_list_app_flutter/constants.dart';

class TaskScreen extends StatefulWidget {
  static const String id = 'TaskScreen';
  TaskScreen({required this.listIcon, required this.listName});

  String listIcon;
  String listName;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryButtonColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ClipPath(
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.black54,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HelpScreen.id);
                      },
                      icon: const Icon(
                        Icons.help,
                        size: 30.0,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
              clipper: TaskScreenClipper(),
            ),
            Expanded(
              //flex: 8,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 80.0,
                            child: Image(
                              image: AssetImage(widget.listIcon),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${Provider.of<TaskData>(context).taskCount} Tasks',
                                style: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                widget.listName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 35.0,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Expanded(
                      child: Container(
                        child: Provider.of<TaskData>(context).taskCount > 0
                            ? TasksList()
                            : NoTaskWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskScreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
