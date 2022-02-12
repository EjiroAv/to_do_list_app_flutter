import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_app_flutter/constants.dart';
import 'package:to_do_list_app_flutter/values.dart';

import 'package:to_do_list_app_flutter/screens/dashboard_screen.dart';

class UpdateUserScreen extends StatefulWidget {
  static String id = 'UpdateUserScreen';

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreen();
}

class _UpdateUserScreen extends State<UpdateUserScreen> {
  Object? _value = 1;
  bool? isMale;
  String? savedUserName;
  String? newUserName;
  TextEditingController controller = TextEditingController();
  late SharedPreferences _sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      _sharedPreferences = sp;
      savedUserName = _sharedPreferences.getString(kUserNameKey);
      isMale = _sharedPreferences.getBool(kGenderKey);

      if (isMale == false) {
        _value = 2;
      }

      setState(() {});
    });
  }

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
                controller: TextEditingController(text: savedUserName),
                textAlign: TextAlign.center,
                decoration: kDecoration.copyWith(hintText: kHintText),
                onChanged: (value) {
                  savedUserName = value;
                },
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
                        print(_value);
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
                        print(_value);
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
                    kDimensionPaddingEdgeInsetsAll_15,
                  ),
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  prefs.setString(kUserNameKey, savedUserName.toString());
                  prefs.setBool(kGenderKey, isMale ?? true);

                  Navigator.pushNamed(context, DashboardScreen.id);
                },
                child: const Text(
                  kUpdateUserScreenButtonText,
                  style: TextStyle(
                    color: kStyleColorWhite,
                    fontSize: kStyleFontSizeValue_15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
