import 'package:flutter/material.dart';

class NoTaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('images/list_empty.png'),
        ),
        Text(
          'List is Empty',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        )
      ],
    );
  }
}
