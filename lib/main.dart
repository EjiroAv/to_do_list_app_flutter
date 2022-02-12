import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app_flutter/models/task_data.dart';
import 'package:to_do_list_app_flutter/screens/create_new_user_page.dart';
import 'package:to_do_list_app_flutter/screens/dashboard_screen.dart';
import 'package:to_do_list_app_flutter/screens/help_screen.dart';
import 'package:to_do_list_app_flutter/screens/start_screen.dart';
import 'package:to_do_list_app_flutter/screens/update_user_screen.dart';
import 'constants.dart';

void main() {
  runApp(TodoListApp());
}

class TodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return TaskData();
      },
      child: MaterialApp(
        theme: kCustomThemeData,
        initialRoute: StartScreen.id,
        routes: {
          StartScreen.id: (context) => StartScreen(),
          DashboardScreen.id: (context) => DashboardScreen(),
          CreateNewUserPage.id: (context) => CreateNewUserPage(),
          UpdateUserScreen.id: (context) => UpdateUserScreen(),
          HelpScreen.id: (context) => HelpScreen(),
        },
      ),
    );
  }
}
