import 'package:to_do_list_app_flutter/models/menu_item.dart';
import 'package:flutter/material.dart';

class MenuItems {
  static final List<MenuItem> itemsList = [itemHelp, itemClearTask];

  static final itemHelp = MenuItem(text: 'Help', icon: Icons.help);
  static final itemClearTask = MenuItem(text: 'Clear Tasks', icon: Icons.clear);
}
