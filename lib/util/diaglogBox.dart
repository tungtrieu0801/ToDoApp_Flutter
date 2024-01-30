import 'package:flutter/material.dart';
import 'package:todoapp/util/myButton.dart';

class alertDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  alertDialog(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: screensize.height*0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Huỷ", onPressed: onCancel),
                SizedBox(
                  width: screensize.width*0.05,
                ),
                MyButton(text: "Thêm", onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
