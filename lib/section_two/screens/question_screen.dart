import 'package:flutter/material.dart';
import 'package:flutter_application_1/section_two/answer_button.dart';
import 'package:flutter_application_1/section_two/const/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      widget.onSelectAnswer(answer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // kenapa quizQuestion tidak bisa ditaruh diatas Widget lagi? karena quizQuestion bergantung pada currentQuestionIndex
    // jika quizQuestion ditaruh diatas Widget, maka quizQuestion akan selalu bernilai question[0]
    // dan tidak akan berubah ketika currentQuestionIndex berubah

    final quizQuestion = question[currentQuestionIndex];

    return SizedBox(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            Text(
              quizQuestion.text,
              style: TextStyle(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lato().fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            // BaseText(quizQuiestion.text, fontSize: 18, fontColor: Colors.white),
            SizedBox(height: 20),
            ...quizQuestion.getShuffledAnswers().map((e) {
              return AnswerButton(answerText: e, onPressed: () => answerQuestion(e));
            }),
          ],
        ),
      ),
    );
  }
}
