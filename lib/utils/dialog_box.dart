import 'package:flutter/material.dart';
import 'package:rapid_recall/utils/color_pallete.dart';
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
    return Stack(children: [
      Center(
        child: Container(
          height: 298,
          width: 358,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: AppColors.shadowColor1,
              spreadRadius: 1,
              offset: Offset(1, 2)
            )],
            borderRadius: BorderRadius.circular(34),
            border: Border.all(width: 4)
          ),
        ),
      ),
      AlertDialog(
        backgroundColor: AppColors.backgroundColor,
        content: SizedBox(
          height: 250,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    TextField(
                      expands: false,
                      controller: questionController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text(
                          "Enter a question",
                          style: TextStyle(
                            overflow: TextOverflow.clip,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: answerController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text(
                          "Enter the answer",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
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
                    text: const Text(
                      "Cancel",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  MyButton(
                    onTap: onSave,
                    text: const Text(
                      "Save",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
