import 'package:flutter/material.dart';
import 'package:to_do_list_app_flutter/widgets/help_widget.dart';
import 'package:to_do_list_app_flutter/values.dart';

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
                title: kHelpScreenValueAddTaskTitle,
                content: kHelpScreenValueAddTaskContent,
              ),
              const SizedBox(
                height: kDimensionValue_10,
              ),
              HelpWidget(
                  title: kHelpScreenValueDeleteTaskTitle,
                  content: kHelpScreenValueDeleteTaskContent),
              const SizedBox(
                height: kDimensionValue_10,
              ),
              HelpWidget(
                  title: kHelpScreenValueUpdateTaskTitle,
                  content: kHelpScreenValueUpdateTaskContent),
              const SizedBox(
                height: kDimensionValue_10,
              ),
              HelpWidget(
                  title: kHelpScreenValueResetAppTitle,
                  content: kHelpScreenValueResetAppContent),
              const SizedBox(
                height: kDimensionValue_50,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(kAppDeveloperCredit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
