class QuizQuestionModel {
  const QuizQuestionModel(this.text, this.answers);

  final String text;
  final List<String> answers;
  // definisi code disini adalah untuk mendapatkan jawaban yang benar
  // dengan cara mengembalikan jawaban pertama dari daftar jawaban
  // jika daftar jawaban kosong, maka akan mengembalikan string kosong
  String get correctAnswer => answers.isNotEmpty ? answers[0] : '';

  List<String> getShuffledAnswers() {
    final shuffledList = List<String>.from(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
