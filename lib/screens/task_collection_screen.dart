import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_app_flutter/constants.dart';
import 'package:to_do_list_app_flutter/models/task_data.dart';
import 'package:to_do_list_app_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app_flutter/screens/update_user_screen.dart';

class TaskCollectionScreen extends StatefulWidget {
  //TODO: Work on the User Interface of this Page Next
  static const String id = 'TaskCollectionScreen';

  @override
  State<TaskCollectionScreen> createState() => _TaskCollectionScreenState();
}

class _TaskCollectionScreenState extends State<TaskCollectionScreen> {
  String? savedUserName;
  bool? isUserMale;
  late SharedPreferences _sharedPreference;

  String getUserProfileImage(bool userGender) {
    String userProfileImage =
        userGender ? 'images/male_profile.png' : 'images/female_profile.png';
    return userProfileImage;
  }

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      _sharedPreference = sp;

      savedUserName = _sharedPreference.getString('UserName').toString();
      isUserMale = _sharedPreference.getBool('Gender');

      savedUserName ??= 'null';

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.sort,
                size: 30.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello $savedUserName',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Today you have ${Provider.of<TaskData>(context).getTodayTaskCount()} tasks',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, UpdateUserScreen.id);
                    },
                    child: CircleAvatar(
                      backgroundColor: kPrimaryColorYellow,
                      child: SizedBox(
                        height: 100.0,
                        child: Image(
                          image: AssetImage(
                            getUserProfileImage(isUserMale ?? true),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      CollectionBubble(
                        icon: 'images/today_icon.png',
                        category: 'Today',
                        numberOfTask:
                            Provider.of<TaskData>(context).getTodayTaskCount(),
                        onTap: () {
                          Provider.of<TaskData>(context, listen: false)
                              .selectListCategory(1);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskScreen(
                                listIcon: 'images/today_icon.png',
                                listName: 'Today',
                              ),
                            ),
                          );
                        },
                      ),
                      CollectionBubble(
                        icon: 'images/planner.png',
                        category: 'Planned',
                        numberOfTask: Provider.of<TaskData>(context)
                            .getPlannedTaskCount(),
                        onTap: () {
                          Provider.of<TaskData>(context, listen: false)
                              .selectListCategory(2);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskScreen(
                                listIcon: 'images/planner.png',
                                listName: 'Planned',
                              ),
                            ),
                          );
                        },
                      ),
                      CollectionBubble(
                        icon: isUserMale ?? true
                            ? 'images/personal_male.png'
                            : 'images/personal_female.png',
                        category: 'Personal',
                        numberOfTask: Provider.of<TaskData>(context)
                            .getPersonalTaskCount(),
                        onTap: () {
                          Provider.of<TaskData>(context, listen: false)
                              .selectListCategory(3);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskScreen(
                                listIcon: isUserMale ?? true
                                    ? 'images/personal_male.png'
                                    : 'images/personal_female.png',
                                listName: 'Personal',
                              ),
                            ),
                          );
                        },
                      ),
                      CollectionBubble(
                        icon: 'images/work_icon.png',
                        category: 'Work',
                        numberOfTask:
                            Provider.of<TaskData>(context).getWorkTaskCount(),
                        onTap: () {
                          Provider.of<TaskData>(context, listen: false)
                              .selectListCategory(4);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskScreen(
                                listIcon: 'images/work_icon.png',
                                listName: 'Work',
                              ),
                            ),
                          );
                        },
                      ),
                      CollectionBubble(
                        icon: 'images/shopping_icon.png',
                        category: 'Shopping',
                        numberOfTask: Provider.of<TaskData>(context)
                            .getShoppingTaskCount(),
                        onTap: () {
                          Provider.of<TaskData>(context, listen: false)
                              .selectListCategory(5);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskScreen(
                                listIcon: 'images/shopping_icon.png',
                                listName: 'Shopping',
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionBubble extends StatelessWidget {
  String icon;
  String category;
  int numberOfTask;
  VoidCallback onTap;

  CollectionBubble(
      {required this.icon,
      required this.category,
      required this.numberOfTask,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Image(
                          image: AssetImage(icon),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$category',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            '$numberOfTask Tasks',
                            style: TextStyle(color: Colors.black26),
                          )
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
            )),
      ),
    );
  }
}
