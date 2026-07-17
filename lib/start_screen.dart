import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class StartScreen extends StatelessWidget {
  //** startQuiz is a positional argument */
  const StartScreen(this.startQuiz , {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          // ** If there is a widget that support color , use the transparence to not affect the performence **
          Image.asset(
            "assests/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          // ** this is a one way to use opacity effect , but if the app is huge it affect the performence **

          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset("assests/images/quiz-logo.png", width: 300),
          // ),
          const SizedBox(height: 80),
           Text(
            'Learn flutter the fun way',
            style: GoogleFonts.gluten(
              color: const Color.fromARGB(255, 244, 207, 255),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.orange, width: 2),

              // لتعديل ابعاد الزر
              visualDensity: const VisualDensity(
                horizontal: 2.0,
                vertical: 2.0,
              ),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start the quiz'),
          ),
        ],
      ),
    );
  }
}
