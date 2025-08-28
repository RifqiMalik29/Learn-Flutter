import 'package:flutter/material.dart';
import 'package:flutter_application_1/section_one/base_text.dart';

class QuizResultWidget extends StatelessWidget {
  const QuizResultWidget({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 20,
      children: summaryData.map((data) {
        bool isCorrect = (data['user_answer'] == data['correct_answer']);
        return Row(
          spacing: 15,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isCorrect ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
              height: 30,
              width: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BaseText(((data['question_index'] as int) + 1).toString(), fontSize: 14, fontWeight: FontWeight.bold,),
              ),
              // child: BaseText(((data['question_index'] as int) + 1).toString(), fontSize: 14,),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(data['question'] as String, fontSize: 20, fontColor: Colors.white),
                  BaseText(data['correct_answer'] as String, fontSize: 14, fontColor: Colors.green),
                  BaseText(data['user_answer'] as String, fontSize: 14, fontColor: Colors.blueAccent,),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
