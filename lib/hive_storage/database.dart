import 'package:hive_flutter/hive_flutter.dart';

class RapidRecallDatabase {
  List qNa = [];

  final _myBox = Hive.box('myBox');

  void createInitialData() {
    qNa = [
      [
        'Why is it called what it is called when its called whatever it is called so that it describes how its called?',
        'Answer 1'
      ],
      ['Question 2', 'Answer 2'],
      ['Question 2', 'Answer 2'],
      ['Question 2', 'Answer 2'],
      ['Question 2', 'Answer 2'],
      ['Question 2', 'Answer 2'],
    ];
  }

  void loadData() {
    qNa = _myBox.get("QNA");
  }

  void updateDataBase() {
    _myBox.put("QNA", qNa);
  }
}
