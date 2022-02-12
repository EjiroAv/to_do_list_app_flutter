import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_app_flutter/constants.dart';
import 'package:to_do_list_app_flutter/screens/dashboard_screen.dart';
import 'package:to_do_list_app_flutter/values.dart';

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
          padding: kDimensionPaddingEdgeInsetsAll_10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: kDecoration.copyWith(hintText: kHintText),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(kRadioButtonOptionMale),
                  Radio(
                    activeColor: kPrimaryButtonColor,
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        isMale = true;
                      });
                    },
                  ),
                  const Text(kRadioButtonOptionFemale),
                  Radio(
                    activeColor: kPrimaryButtonColor,
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        isMale = false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: kDimensionValue_10,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(kPrimaryButtonColor),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(kDimensionValue_15),
                  ),
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  prefs.setString(kUserNameKey, controller.text);
                  prefs.setBool(kGenderKey, isMale ?? true);

                  prefs.setBool(newUserKey, false);

                  Navigator.pushNamed(context, DashboardScreen.id);
                },
                child: const Text(
                  kCreateNewUserScreenButtonText,
                  style: TextStyle(
                      color: kStyleColorWhite,
                      fontSize: kStyleFontSizeValue_15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
