import 'package:flutter/material.dart';
import '/data/questions.dart';
import 'answer_button.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // ** widget is to get access from State class to widget class
    //which in this page is name QuestionsScreen

    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // currentQuestionINdex = currentQuestionINdex + 1; // is correct but too long
      // currentQuestionIndex += 1; // is the best practice if you want to increase the value by 2 or more

      currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    // ** The SizedBox widget can be used to center the column widget **
    // ** if it's width double.infinity and the column mainAxisAlignemnt .center **

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: .stretch,

          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: .bold,
                fontSize: 18,
              ),
              textAlign: .center,
            ),

            const SizedBox(height: 24),

            //** the ... is to separate items form it's list becuase children[] does not accept
            //** type list as child */
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: () {
                answerQuestion(answer); 
              },);
            }),
          ],
        ),
      ),
    );
  }
}
