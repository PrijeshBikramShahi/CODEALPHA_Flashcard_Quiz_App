import 'package:flutter/material.dart';
import 'package:rapid_recall/hive_storage/database.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({
    super.key,
    required this.score,
    required this.db,
  });

  final int score;
  final RapidRecallDatabase db;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: Text(
            (score == db.qNa.length)
                ? "CONGRATS!!! \n You scored $score/${db.qNa.length.toString()}!!"
                : "Your Final Score is $score/${db.qNa.length.toString()} \n Try Harder!",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  }
}
