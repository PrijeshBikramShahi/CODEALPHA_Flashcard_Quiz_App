import 'package:hive_flutter/hive_flutter.dart';

class RapidRecallDatabase {
  List qNa = [];

  final _myBox = Hive.box('myBox');

  void createInitialData() {
    qNa = [
      [
        'What does CSS stand for?',
        'Cascading Style Sheet'
      ],
      [
        'What does HTML stand for?',
        'HyperText Markup Language'
      ],
      [
        'What is the default port for HTTP?',
        '80'
      ],
      [
        'What does SQL stand for?',
        'Structured Query Language'
      ],
      [
        'In JavaScript, what keyword is used to declare a variable?',
        'var or let/const'
      ],
    ];
  }

  void loadData() {
    qNa = _myBox.get("QNA");
  }

  void updateDataBase() {
    _myBox.put("QNA", qNa);
  }
}
