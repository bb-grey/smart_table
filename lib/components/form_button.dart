import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  FormButton({this.title = 'Log in', this.onPress});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.pink,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(
          color: Colors.pink,
          width: 1.0,
        ),
      ),
    );
  }
}
