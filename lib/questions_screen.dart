import 'package:flutter/material.dart';

// Provides the list of Question objects displayed by this screen.
import '/data/questions.dart';

// Provides the reusable button used for each possible answer.
import 'answer_button.dart';

// Provides the Lato font used to style the question text.
import 'package:google_fonts/google_fonts.dart';

// A StatefulWidget is required because the displayed question changes whenever
// the user selects an answer.
class QuestionsScreen extends StatefulWidget {
  // The parent supplies a callback that receives each selected answer.
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  // The String parameter carries the text of the answer selected by the user.
  final void Function(String answer) onSelectAnswer;

  @override
  // Flutter creates this State object to store values that can change while
  // the QuestionsScreen widget remains in the widget tree.
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // List indexes start at zero, so the quiz initially displays the first
  // question in the questions list.
  var currentQuestionIndex = 0;

  // Record the selected answer and then advance to the next question.
  void answerQuestion(String selectedAnswer) {
    // `widget` gives this State class access to properties declared on its
    // associated QuestionsScreen widget, including the parent's callback.
    widget.onSelectAnswer(selectedAnswer);

    // setState tells Flutter that a value used by build has changed and that
    // this screen must be rebuilt to display the next question.
    setState(() {
      // `currentQuestionIndex = currentQuestionIndex + 1` produces the same
      // result but is longer. `currentQuestionIndex += amount` is useful when
      // increasing the value by a number other than one.

      // The ++ operator increments the current value by exactly one.
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    // Use the current index to retrieve the question that should be rendered
    // during this build.
    final currentQuestion = questions[currentQuestionIndex];

    // Giving SizedBox the full available width allows its child Column to use
    // that space. The Column can then center its children on the vertical axis.
    return SizedBox(
      width: double.infinity,

      // Container adds equal spacing around the question and answer controls.
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          // Center the group vertically within the available screen height.
          mainAxisAlignment: MainAxisAlignment.center,

          // Stretch the children across the Column's horizontal cross axis.
          // This also gives every answer button the same available width.
          crossAxisAlignment: .stretch,
          children: [
            // Display the text belonging to the current Question object.
            Text(
              currentQuestion.text,
              // GoogleFonts.lato creates a Lato TextStyle with the supplied
              // color, weight, and font size.
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: .bold,
                fontSize: 18,
              ),
              textAlign: .center,
            ),

            // Add vertical space between the question and its answers.
            const SizedBox(height: 24),

            // getShuffledAnswers returns the answers in a new random order so
            // the correct answer does not always appear in the same position.
            // `map` transforms each answer String into an AnswerButton widget.
            // The spread operator (`...`) inserts those widgets individually
            // because `children` expects widgets rather than a nested list.
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,

                // The closure remembers this specific answer and passes it to
                // answerQuestion only when its button is tapped.
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
