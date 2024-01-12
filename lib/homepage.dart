import 'package:flutter/material.dart';
import 'package:rapid_recall/utils/dialog_box.dart';
import 'package:rapid_recall/utils/flashcard.dart';
import 'package:rapid_recall/utils/floating_button.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List QnA = [
    ['Question1', 'Answer1'],
    ['Question2', 'Answer2'],
    ['Question3', 'Answer3'],
    ['Question4', 'Answer4'],
    ['Question5', 'Answer5'],
  ];

  final _controller = SwipableStackController();
  String theQuestion = "Question";
  String theAnswer = "Answer";
  Color theColor = Colors.red;

  void _addAQuestion() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipableStack(
        controller: _controller,
        itemCount: QnA.length,
        builder: (context, itemSwipeProperties) {
          return FlashCard(
            question: QnA[_controller.currentIndex][0],
            answer: QnA[_controller.currentIndex][1],
            color: theColor,
          );
        },
      ),
      floatingActionButton: FloatingButton(addButton: () {
        _addAQuestion();
      }),
    );
  }
}
