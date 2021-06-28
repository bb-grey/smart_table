import 'package:flutter/material.dart';
import '../constants.dart';

class AppHeading extends StatelessWidget {
  final String text;
  AppHeading({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1.copyWith(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}
