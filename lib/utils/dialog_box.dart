import 'package:flutter/material.dart';
import 'package:rapid_recall/utils/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  DialogBox({
    super.key,
    required this.questionController,
    required this.answerController,
    required this.onCancel,
    required this.onSave,
  });

  final TextEditingController questionController;
  final TextEditingController answerController;

  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: questionController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                label: Text("Enter a question"),
              ),
              style: TextStyle(),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: answerController,
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
