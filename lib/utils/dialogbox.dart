import 'package:flutter/material.dart';
import 'package:to_do_app/utils/buttons.dart';

class DialogeBox extends StatelessWidget {
  final controller;
  VoidCallback onCancel;
  VoidCallback onSave;
  DialogeBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 150,
        width: 400,
        // get input
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a task..."),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyBtn(
                  text: 'Cancel',
                  onPressed: onCancel,
                  color: Colors.black38,
                ),
                const SizedBox(
                  width: 10,
                ),
                MyBtn(
                  text: 'Save',
                  onPressed: onSave,
                  color: Theme.of(context).primaryColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
