import 'package:flutter/material.dart';

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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
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
