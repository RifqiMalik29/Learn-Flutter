import 'package:flutter/material.dart';
import 'package:flutter_application_1/section_one/base_text.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatelessWidget {
  const Quiz(this.switchWidget, {super.key});

  final void Function()? switchWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              Image.asset(
                'public/assets/images/quiz-logo.png',
                width: 300,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
              // Opacity tidak disarankan karena dapat mempengaruhi performa
              // Opacity(
              //   opacity: 0.8,
              //   child: Image.asset('public/assets/images/quiz-logo.png'),
              // ),
              const SizedBox(height: 30),
              Text(
                'Learn Flutter the fun way',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
              OutlinedButton.icon(
                onPressed: switchWidget,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.transparent),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    right: 12,
                    left: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: Icon(Icons.arrow_right_alt),
                label: BaseText(
                  'Start Quiz',
                  fontSize: 16,
                  fontColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
