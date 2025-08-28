import 'package:flutter/material.dart';
import 'package:flutter_application_1/section_two/const/question.dart';
import 'package:flutter_application_1/section_two/screens/question_screen.dart';
import 'package:flutter_application_1/section_two/screens/quiz_screen.dart';
import 'package:flutter_application_1/section_two/screens/result_screen.dart';

class SectionTwoContainer extends StatefulWidget {
  const SectionTwoContainer({super.key});

  @override
  State<SectionTwoContainer> createState() => _SectionTwoContainerState();
}

class _SectionTwoContainerState extends State<SectionTwoContainer> {
  Widget? activeScreen;
  final List<String> selectedAnswers = [];

  // initState konsepnya sama seperti useEffect
  @override
  void initState() {
    activeScreen = Quiz(switchWidget);
    super.initState();
  }

  void switchWidget() {
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void onResetWidget() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = Quiz(switchWidget);
    });
  }

  void chooseAnswer(String answer) {
    // add adalah menambahkan jawaban yang dipilih ke dalam daftar jawaban yang dipilih
    // tanpa duplikasi
    selectedAnswers.add(answer);
    if (selectedAnswers.length >= question.length) {
      // show result screen
      setState(() {
        activeScreen = ResultScreen(
          selectedAnswers: selectedAnswers,
          onResetWidget: onResetWidget,
        );
      });
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 81, 37, 155),
        body: activeScreen,
      ),
    );
  }
}
