import 'package:flutter/material.dart';
import 'package:rapid_recall/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  void onSave(){}
  void onCancel(){}

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                label: Text("Enter a question"),
              ),
              style: TextStyle(),
            ),
            const SizedBox(
              height: 15,
            ),
            const TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                label: Text("Enter the answer"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  onTap: onCancel,
                  text: const Text("Cancel"),
                ),
                MyButton(
                  onTap: onSave,
                  text: const Text("Save"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
