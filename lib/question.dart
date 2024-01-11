class Question {
  final String question;
  final List<String> options;
  final int correctAnsIndex;

  Question(
      {required this.question,
      required this.options,
      required this.correctAnsIndex});
}
