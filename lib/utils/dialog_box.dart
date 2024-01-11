import 'package:flutter/material.dart';
import 'package:rapid_recall/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                label: Text("Enter a question"),
              ),
              style: TextStyle(
                
              ),
            ),
            SizedBox(height: 15,),
            TextField(decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                label: Text("Enter the answer"),
              ),),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  text: Text("Cancel"),
                ),
            MyButton(
              text: Text("Save"),
            )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
