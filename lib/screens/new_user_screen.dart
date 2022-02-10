import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_app_flutter/screens/create_new_user_page.dart';
import 'package:to_do_list_app_flutter/screens/task_collection_screen.dart';
import 'package:to_do_list_app_flutter/constants.dart';

class NewUserScreen extends StatefulWidget {
  static const String id = 'NewUserScreen';

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  late SharedPreferences _sharedPreferences;
  bool? isUserNew;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      _sharedPreferences = sp;

      isUserNew = _sharedPreferences.getBool('isUserNew') ?? true;

      if (isUserNew == false) {
        Navigator.pushReplacementNamed(context, TaskCollectionScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/new_user_background_image.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Organise Your Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tudy is a simple and effective to-do List and task Manager app which helps track and manage your important task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black26, fontSize: 18),
              ),
              SizedBox(
                height: 25,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(kPrimaryButtonColor),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(20.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CreateNewUserPage.id);
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
