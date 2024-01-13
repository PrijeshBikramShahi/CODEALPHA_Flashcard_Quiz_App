import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rapid_recall/hive_storage/database.dart';
import 'package:rapid_recall/utils/color_pallete.dart';
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
  final _myBox = Hive.box('myBox');
  RapidRecallDatabase db = RapidRecallDatabase();

  final _questionController = TextEditingController();
  final _answerController = TextEditingController();
  final _controller = SwipableStackController();
  int score = 0;
  String theQuestion = "Question";
  String theAnswer = "Answer";
  Color theFrontColor = AppColors.foregroundColor;
  Color theBackColor = Colors.blueAccent;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    if (_myBox.get("QNA") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void saveNewQuestion() {
    setState(() {
      db.qNa.add([_questionController.text, _answerController.text]);
      _questionController.clear();
      _answerController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void correctAnswer() {
    setState(() {
      score++;
      _controller.next(
        duration: Duration(milliseconds: 1500),
        swipeDirection: SwipeDirection.right,
      );
    });
  }

  void wrongAnswer() {
    _controller.next(
      duration: Duration(milliseconds: 1500),
      swipeDirection: SwipeDirection.left,
    );
  }

  void shuffleButtonClicked() {
    if (db.qNa.isEmpty) {
      setState(() {
        db.createInitialData();
        db.loadData();
        db.qNa.shuffle();
      });
    } else {
      setState(() {
        db.qNa.shuffle();
      });
    }
  }

  void editButtonClicked(int index) {
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
              onSave: () {
                setState(() {
                  db.qNa[index][0] = _questionController.text;
                  db.qNa[index][1] = _answerController.text;
                });
                _questionController.clear();
                _answerController.clear();
                Navigator.of(context).pop();
              });
        });
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
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Score: ${score}",
                    style: TextStyle(
                      shadows: [
                        BoxShadow(
                          color: AppColors.shadowColor1,
                          offset: Offset(3, 4),
                          spreadRadius: 5,
                        )
                      ],
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        editButtonClicked(_controller.currentIndex);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: AppColors.shadowColor1,
                                spreadRadius: 2,
                                offset: Offset(1, 2))
                          ],
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.editButtonColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        shuffleButtonClicked();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: AppColors.shadowColor1,
                                spreadRadius: 2,
                                offset: Offset(1, 2))
                          ],
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.shuffleButtonColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.shuffle_rounded,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SwipableStack(
        onSwipeCompleted: (index, direction) {
          db.qNa.remove(_controller.currentIndex);
        },
        controller: _controller,
        itemCount: db.qNa.length,
        builder: (context, itemSwipeProperties) {
          return FlashCard(
            onCorrectClick: correctAnswer,
            onWrongClick: wrongAnswer,
            questionNo: (_controller.currentIndex + 1).toString(),
            question: db.qNa[_controller.currentIndex][0],
            answer: db.qNa[_controller.currentIndex][1],
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
