import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text,style: TextStyle(fontSize: 17),),
      padding: EdgeInsets.all(6.0),
      color: Colors.blue,
    );
  }
}
