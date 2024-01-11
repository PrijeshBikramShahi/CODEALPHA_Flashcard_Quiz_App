import 'package:flutter/material.dart';
import 'package:rapid_recall/utils/dialog_box.dart';
import 'package:rapid_recall/utils/flashcard.dart';
import 'package:rapid_recall/utils/floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: FlashCard(),
      floatingActionButton: FloatingButton(addButton: () {
      _addAQuestion();
      }),
    );
  }
}
