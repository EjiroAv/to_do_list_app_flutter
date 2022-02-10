import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_app_flutter/constants.dart';
import 'package:to_do_list_app_flutter/screens/task_collection_screen.dart';

class CreateNewUserPage extends StatefulWidget {
  static String id = 'CreateNewUserPage';

  @override
  State<CreateNewUserPage> createState() => _CreateNewUserPageState();
}

class _CreateNewUserPageState extends State<CreateNewUserPage> {
  Object? _value = 1;
  bool? isMale;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: kDecoration.copyWith(hintText: 'Enter your Name'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Male'),
                  Radio(
                    activeColor: kPrimaryButtonColor,
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        isMale = true;
                        print(_value);
                      });
                    },
                  ),
                  const Text('Female'),
                  Radio(
                    activeColor: kPrimaryButtonColor,
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        isMale = false;
                        print(_value);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(kPrimaryButtonColor),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(15.0),
                  ),
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  prefs.setString('UserName', controller.text);
                  prefs.setBool('Gender', isMale ?? true);

                  prefs.setBool('isUserNew', false);

                  print(controller.text);

                  print(prefs.getString('UserName'));
                  print(prefs.getBool('Gender'));

                  Navigator.pushNamed(context, TaskCollectionScreen.id);
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
