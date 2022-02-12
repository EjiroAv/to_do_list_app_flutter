import 'dart:ui';

import 'package:flutter/material.dart';

//ThemeData
ThemeData kCustomThemeData = ThemeData(fontFamily: 'Poppins');

//SharedPrefence Keys
const String kUserNameKey = 'UserName';
const String kGenderKey = 'Gender';
const String newUserKey = 'isUserNew';

//Category IDs
const String kTodayCategoryId = 'Today';
const String kPlannedCategoryId = 'Planned';
const String kPersonalCategoryId = 'Personal';
const String kWorkCategoryId = 'Work';
const String kShoppingCategoryId = 'Shopping';

// // For TaskCount - I can't seem to use the same list I use to navigate to get Individual taskCount
// // Will come back when I figure out a better Solution, so for now just bare with me.
// const String kTodayCategory = 'Today';
// const String kPlannedCategory = 'Planned';
// const String kPersonalCategory = 'Personal';
// const String kWorkCategory = 'Work';
// const String kShoppingCategory = 'Shopping';

//Colors
const Color kPrimaryColorYellow = Color(0xfff9ea84);
const Color kPrimaryButtonColor = Color(0xff478a6d);
const Color kStyleColorWhite = Colors.white;
const Color kStyleColorBlack_54 = Colors.black54;
const Color kStyleColorBlack = Colors.black;
const kStyleColorTeal = Colors.teal;
const Color kAddTaskScreenGrey = Color(0xff757575);
const kStyleColorBlack_26 = Colors.black26;

//Decorations
const InputDecoration kDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryButtonColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryButtonColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

//Dimensions

//BorderRadius Circular
const Radius kDimensionRadiusCircular_20 = Radius.circular(20.0);
const Radius kDimensionRadiusCircular_10 = Radius.circular(10.0);

//Margin
const EdgeInsets kDimensionValueMarginEdgeInsetsAll_10 = EdgeInsets.all(10.0);

//Padding
const EdgeInsets kDimensionPaddingEdgeInsetAll_20 = EdgeInsets.all(20.0);
const EdgeInsets kDimensionPaddingEdgeInsetsAll_15 = EdgeInsets.all(15.0);
const EdgeInsets kDimensionPaddingEdgeInsetsAll_10 = EdgeInsets.all(10.0);
const EdgeInsets kDimensionPaddingEdgeInsetsAll_30 = EdgeInsets.all(30.0);

//Images
const AssetImage kStartScreenBackgroundImage =
    AssetImage('images/new_user_background_image.png');

const AssetImage kEmptyListBackgroundImage =
    AssetImage('images/list_empty.png');
