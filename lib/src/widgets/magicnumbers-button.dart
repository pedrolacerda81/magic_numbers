import 'package:flutter/material.dart';

class MagicNumbersButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color color;
  final Color splashColor;
  final Function onPressed;

  MagicNumbersButton({
    this.title,
    this.titleColor,
    this.color,
    this.splashColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            splashColor: splashColor,
            color: color,
            child: Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: 16.0,
              ),
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
