import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton(this.label, this.width, this.height);

  final String label;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.white,
          side: BorderSide(
            width: 1.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
