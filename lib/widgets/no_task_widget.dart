import 'package:flutter/material.dart';
import 'package:to_do_list_app_flutter/constants.dart';
import 'package:to_do_list_app_flutter/values.dart';

class NoTaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
          image: kEmptyListBackgroundImage,
        ),
        Text(
          kEmptyListMainText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        Text(kEmptyListSupportingText),
      ],
    );
  }
}
