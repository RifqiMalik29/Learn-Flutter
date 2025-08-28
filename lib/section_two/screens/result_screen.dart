import 'package:flutter/material.dart';
import 'package:flutter_application_1/section_one/base_text.dart';
import 'package:flutter_application_1/section_two/const/question.dart';
import 'package:flutter_application_1/section_two/widgets/quiz_result_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.selectedAnswers,
    required this.onResetWidget,
  });

  final List<String> selectedAnswers;
  final void Function() onResetWidget;

  // penjelasan dari code ini
  // code ini digunakan untuk mendapatkan ringkasan data dari hasil kuis
  // dengan membandingkan jawaban yang dipilih dengan jawaban yang benar
  // jika jawaban yang dipilih benar, maka tambahkan ke dalam daftar ringkasan

  // Map disini adalah suatu struktur data
  // yang menyimpan data dalam bentuk pasangan kunci-nilai

  // String adalah keys, dan Object adalah values
  // untuk getSummaryData disini ada cara yang lebih baik yaitu menggunakan get
  // alasan menggunakan get adalah untuk menyederhanakan kode dan meningkatkan keterbacaan
  // karena summaryData disini tidak ada tambahan parameter, hanya return data
  // hasilnya seperti ini (get summaryData) tanpa () nantinya function ini bisa digunakan seperti variabel
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        // Bisa dilihat disini Key adalah question_index dll
        // Sedangkan valuenya adalah setelah :
        // Alasan value menggunakan Object adalah karena value bisa berupa String, int, dll
        'question_index': i,
        'question': question[i].text,
        'correct_answer': question[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = question.length;
    // untuk pemanggil tidak perlu memanggil function seperti getSummaryData
    // tapi bisa langsung di akses seperti variabel summaryData
    // hasilnya seperti ini || final numCorrectQuestion = summaryData
    final numCorrectQuestion = getSummaryData()
    // arrow function hanya bisa digunakan jika logic tidak terlalu banyak
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lato().fontFamily,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: QuizResultWidget(summaryData: getSummaryData()),
              ),
            ),
            SizedBox(height: 16),
            TextButton.icon(
              onPressed: onResetWidget,
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const BaseText('Restart Quiz!', fontColor: Colors.white, fontSize: 18,),
            ),
          ],
        ),
      ),
    );
  }
}
