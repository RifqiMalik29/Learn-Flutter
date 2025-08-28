import 'package:flutter/material.dart';
import 'package:flutter_application_1/section_one/base_text.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, this.onPressed});

  final String answerText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      child: BaseText(answerText, fontColor: Colors.white, fontSize: 14),
    );
  }
}
