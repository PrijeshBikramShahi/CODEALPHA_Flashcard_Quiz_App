import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlashCard extends StatelessWidget {
  const FlashCard(
      {super.key,
      required this.question,
      required this.answer,
      required this.frontColor,
      required this.backColor});
  final String question;
  final String answer;
  final Color frontColor;
  final Color backColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlipCard(
        front: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.black,
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(1, 1)

            )],
            border: Border.all(width: 2),
            color: frontColor,
          ),
          height: 550,
          width: 350,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: -1,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            color: backColor,
          ),
          height: 550,
          width: 350,
          child: Center(
            child: Text(
              answer,
              textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: -1,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  overflow: TextOverflow.clip,
                ),
            ),
          ),
        ),
      ),
    );
  }
}
