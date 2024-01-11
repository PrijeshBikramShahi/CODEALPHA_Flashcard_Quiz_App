import 'package:flutter/material.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                color: Colors.orangeAccent,
              ),
              height: 550,
              width: 350,
              child: Center(
                child: Text("Question"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
