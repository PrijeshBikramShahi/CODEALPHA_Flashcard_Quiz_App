import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlashCard extends StatelessWidget {
  const FlashCard({super.key, required this.question, required this.answer, required this.color});
  final String question;
  final String answer;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlipCard(
        front: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            color: Colors.orangeAccent,
          ),
          height: 550,
          width: 350,
          child:  Center(
            child: Text(question),
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            color: Colors.orangeAccent,
          ),
          height: 550,
          width: 350,
          child:  Center(
            child: Text(answer),
          ),
        ),
      ),
    );
  }
}
