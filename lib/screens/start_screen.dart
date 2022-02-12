import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_app_flutter/screens/create_new_user_page.dart';
import 'package:to_do_list_app_flutter/screens/task_collection_screen.dart';
import 'package:to_do_list_app_flutter/constants.dart';
import 'package:to_do_list_app_flutter/values.dart';

class StartScreen extends StatefulWidget {
  static const String id = 'StartScreen';

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late SharedPreferences _sharedPreferences;
  bool? isUserNew;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      _sharedPreferences = sp;

      isUserNew = _sharedPreferences.getBool('isUserNew') ?? true;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleColorWhite,
      body: SafeArea(
        child: Padding(
          padding: kDimensionPaddingEdgeInsetAll_20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: kStartScreenBackgroundImage,
              ),
              const SizedBox(
                height: kDimensionValue_10,
              ),
              const Text(
                kStartScreenValueTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: kStyleFontSizeValue_28,
                ),
              ),
              const SizedBox(
                height: kDimensionValue_10,
              ),
              const Text(
                kStartScreenValueSubTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kStyleColorBlack_26,
                  fontSize: kStyleFontSizeValue_18,
                ),
              ),
              const SizedBox(
                height: kDimensionValue_25,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(kPrimaryButtonColor),
                  padding: MaterialStateProperty.all(
                    kDimensionPaddingEdgeInsetAll_20,
                  ),
                ),
                onPressed: () {
                  final shouldCreateNewUser = isUserNew ?? true;
                  shouldCreateNewUser
                      ? Navigator.pushNamed(context, CreateNewUserPage.id)
                      : Navigator.pushNamed(context, TaskCollectionScreen.id);
                },
                child: const Text(
                  kStartScreenButtonText,
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
