import 'package:flutter/material.dart';
import '../constants.dart';

class SendActionButton extends StatelessWidget {
  final IconData icon;
  SendActionButton({this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding / 2.0),
      width: 54.0,
      height: 54.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(54.0),
        color: Colors.white,
      ),
      child: Icon(
        icon,
        color: Colors.teal.shade900,
        size: 32.0,
      ),
    );
  }
}
