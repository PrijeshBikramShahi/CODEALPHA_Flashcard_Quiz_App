import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:rapid_recall/utils/color_pallete.dart';

// ignore: must_be_immutable
class FlashCard extends StatelessWidget {
  FlashCard({
    super.key,
    required this.question,
    required this.answer,
    required this.frontColor,
    required this.backColor,
    required this.questionNo,
    required this.onCorrectClick,
    required this.onWrongClick,
    required this.onDeleteClick,
  });
  final String questionNo;
  final String question;
  final String answer;
  final Color frontColor;
  final Color backColor;

  VoidCallback onWrongClick;
  VoidCallback onCorrectClick;
  VoidCallback onDeleteClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 80),
      child: Column(children: [
        FlipCard(
          front: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(1, 1))
              ],
              border: Border.all(width: 2),
              color: frontColor,
            ),
            height: 550,
            width: 350,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "#$questionNo",
                            style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5),
                          ),
                        ),
                        InkWell(
                          onTap: onDeleteClick,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.shadowColor2,
                                      offset: Offset(1, 2),
                                      spreadRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.wrongButtonColor),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.delete,
                                size: 36,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        letterSpacing: -1,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    const SizedBox()
                  ],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 14.0,
                      top: 20,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Answer:",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.7),
                      ),
                    ),
                  ),
                  Text(
                    answer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      letterSpacing: -1,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: onWrongClick,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.blueAccent,
                                      spreadRadius: 2,
                                      offset: Offset(1, 2))
                                ],
                                border: Border.all(width: 3),
                                color: const Color.fromARGB(255, 221, 82, 64),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Icon(
                              Icons.cancel_outlined,
                              size: 50,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: onCorrectClick,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 2,
                                  offset: Offset(1, 2),
                                  color: Colors.blueAccent,
                                ),
                              ],
                              border: Border.all(width: 3),
                              color: AppColors.correctButtonColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
