import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_app_flutter/constants.dart';
import 'package:to_do_list_app_flutter/models/task_data.dart';
import 'package:to_do_list_app_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app_flutter/screens/update_user_screen.dart';
import 'package:to_do_list_app_flutter/values.dart';

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
        userGender ? kImageValueProfileMale : kImageValueProfileFemale;
    return userProfileImage;
  }

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      _sharedPreference = sp;

      savedUserName = _sharedPreference.getString(kUserNameKey).toString();
      isUserMale = _sharedPreference.getBool(kGenderKey);

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
          padding: kDimensionPaddingEdgeInsetsAll_30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.sort,
                size: kDimensionValue_30,
              ),
              const SizedBox(
                height: kDimensionValue_20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello $savedUserName',
                        style: const TextStyle(
                          fontSize: kStyleFontSizeValue_20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Today you have ${Provider.of<TaskData>(context).getTodayTaskCount()} tasks',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        UpdateUserScreen.id,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: kPrimaryColorYellow,
                      child: SizedBox(
                        height: kDimensionValue_100,
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
                height: kDimensionValue_50,
              ),
              Expanded(
                child: ListView(
                  children: [
                    CollectionBubble(
                      icon: kImageValueTodayIcon,
                      category: kTodayCategoryId,
                      numberOfTask:
                          Provider.of<TaskData>(context).getTodayTaskCount(),
                      onTap: () {
                        Provider.of<TaskData>(context, listen: false)
                            .selectListCategory(1);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskScreen(
                              listIcon: kImageValueTodayIcon,
                              listName: kTodayCategoryId,
                            ),
                          ),
                        );
                      },
                    ),
                    CollectionBubble(
                      icon: kImageValuePersonalIcon,
                      category: kPlannedCategoryId,
                      numberOfTask:
                          Provider.of<TaskData>(context).getPlannedTaskCount(),
                      onTap: () {
                        Provider.of<TaskData>(context, listen: false)
                            .selectListCategory(2);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskScreen(
                              listIcon: kImageValuePersonalIcon,
                              listName: kPlannedCategoryId,
                            ),
                          ),
                        );
                      },
                    ),
                    CollectionBubble(
                      icon: isUserMale ?? true
                          ? kImageValuePersonalMaleIcon
                          : kImageValuePersonalFemaleIcon,
                      category: kPersonalCategoryId,
                      numberOfTask:
                          Provider.of<TaskData>(context).getPersonalTaskCount(),
                      onTap: () {
                        Provider.of<TaskData>(context, listen: false)
                            .selectListCategory(3);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskScreen(
                              listIcon: isUserMale ?? true
                                  ? kImageValuePersonalMaleIcon
                                  : kImageValuePersonalFemaleIcon,
                              listName: kPersonalCategoryId,
                            ),
                          ),
                        );
                      },
                    ),
                    CollectionBubble(
                      icon: kImageValueWorkIcon,
                      category: kWorkCategoryId,
                      numberOfTask:
                          Provider.of<TaskData>(context).getWorkTaskCount(),
                      onTap: () {
                        Provider.of<TaskData>(context, listen: false)
                            .selectListCategory(4);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskScreen(
                              listIcon: kImageValueWorkIcon,
                              listName: kWorkCategoryId,
                            ),
                          ),
                        );
                      },
                    ),
                    CollectionBubble(
                      icon: kImageValueShoppingIcon,
                      category: kShoppingCategoryId,
                      numberOfTask:
                          Provider.of<TaskData>(context).getShoppingTaskCount(),
                      onTap: () {
                        Provider.of<TaskData>(context, listen: false)
                            .selectListCategory(5);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskScreen(
                              listIcon: kImageValueShoppingIcon,
                              listName: kShoppingCategoryId,
                            ),
                          ),
                        );
                      },
                    )
                  ],
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
        margin: kDimensionValueMarginEdgeInsetsAll_10,
        child: Material(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            kDimensionRadiusCircular_10,
          ),
          elevation: 10,
          child: Padding(
            padding: kDimensionPaddingEdgeInsetAll_20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: kDimensionValue_50,
                      child: Image(
                        image: AssetImage(icon),
                      ),
                    ),
                    const SizedBox(
                      width: kDimensionValue_8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: const TextStyle(
                            fontSize: kStyleFontSizeValue_18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          '$numberOfTask Tasks',
                          style: const TextStyle(color: kStyleColorBlack_26),
                        )
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.more_vert),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
