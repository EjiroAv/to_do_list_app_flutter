import 'package:flutter/material.dart';
import 'package:to_do_list_app_flutter/values.dart';

class HelpWidget extends StatelessWidget {
  final String title;
  final String content;

  HelpWidget({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: kStyleFontSizeValue_16,
          ),
        ),
        Text(
          content,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
