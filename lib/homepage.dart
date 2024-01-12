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
  List qNa = [
    ['Question1', 'Answer1'],
  ];
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();
  final _controller = SwipableStackController();
  String theQuestion = "Question";
  String theAnswer = "Answer";
  Color theFrontColor = Colors.orangeAccent;
  Color theBackColor = Colors.blueAccent;

  void saveNewQuestion() {
    setState(() {
      qNa.add([_questionController.text, _answerController.text]);
      _questionController.clear();
      _answerController.clear();
    });
    Navigator.of(context).pop();
  }

  void addAQuestion() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          questionController: _questionController,
          answerController: _answerController,
          onCancel: () {
            _questionController.clear();
            _answerController.clear();
            Navigator.of(context).pop();
          },
          onSave: saveNewQuestion,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipableStack(
        controller: _controller,
        itemCount: qNa.length,
        builder: (context, itemSwipeProperties) {
          return FlashCard(
            question: qNa[_controller.currentIndex][0],
            answer: qNa[_controller.currentIndex][1],
            frontColor: theFrontColor,
            backColor: theBackColor,
          );
        },
      ),
      floatingActionButton: FloatingButton(addButton: () {
        addAQuestion();
      }),
    );
  }
}
