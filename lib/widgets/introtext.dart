import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  IntroText(this.label1, this.label2);

  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 25.0,
        ),
        Text(
          label1,
          style: TextStyle(
              color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          label2,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}
