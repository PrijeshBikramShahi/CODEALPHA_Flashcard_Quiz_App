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
  String theQuestion = "Question";
  String theAnswer = "Answer";
  Color theFrontColor = AppColors.foregroundColor;
  Color theBackColor = Colors.blueAccent;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    if (_myBox.get("TODOLIST") == null) {
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
  }

  void editSave(int index) {
    setState(() {
      db.qNa[index][0] = _questionController.text;
      db.qNa[index][1] = _answerController.text;
    });
    _questionController.clear();
    _answerController.clear();
    Navigator.of(context).pop();
  }

  void editButtonClicked(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              questionController: _questionController,
              answerController: _answerController,
              onCancel: () {},
              onSave: (){});
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
            child: GestureDetector(

              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor1,
                    )
                  ],
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.foregroundColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(.0),
                  child: Icon(
                    Icons.shuffle_rounded,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SwipableStack(
        controller: _controller,
        itemCount: db.qNa.length,
        builder: (context, itemSwipeProperties) {
          return FlashCard(
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
