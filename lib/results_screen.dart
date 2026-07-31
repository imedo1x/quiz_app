import 'package:flutter/material.dart';

// Imports the original quiz questions, including their text and answer lists.
import 'data/questions.dart';

// Imports the custom widget that turns the generated summary data into the
// question-and-answer rows shown on this screen.
import 'questions_summary.dart';

// ResultsScreen displays the completed quiz data supplied by Quiz.
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  // The final field stores the same ordered list collected by Quiz.
  final List<String> chosenAnswers;

  // Builds a richer record for every selected answer. The return type says that
  // the method produces a List of Maps whose keys are Strings and whose values
  // can be different Object subtypes, such as int and String.
  List<Map<String, Object>> getSummaryData() {
    // Start with an empty, explicitly typed list that will receive one Map for
    // every question.
    final List<Map<String, Object>> summary = [];

    // `i` begins at zero, continues while it is a valid chosen-answer index,
    // and increases by one after each loop iteration.
    for (var i = 0; i < chosenAnswers.length; i++) {
      // add inserts a new result record at the end of the summary list.
      summary.add({
        // The shared index connects all data belonging to the same question.
        'question_index': i,

        // Retrieve the question text from the question at index i.
        'question': questions[i].text,

        // In this app's question model, the first answer is the correct answer.
        'correct_answer': questions[i].answers[0],

        // Retrieve the user's answer at the matching index.
        'user_answer': chosenAnswers[i],
      });
    }

    // Return the completed list to the caller.
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    // SizedBox gives its child all available horizontal space. The shorthand
    // `.infinity` is inferred as double.infinity from the width parameter.
    return SizedBox(
      width: .infinity,

      // Container adds space around the results content.
      child: Container(
        // Apply 40 logical pixels of margin on every side.
        margin: const EdgeInsets.all(40),

        // Column vertically arranges the heading, summary, spacing, and button.
        child: Column(
          // Center the group along the Column's vertical main axis.
          mainAxisAlignment: .center,
          children: [
            // This placeholder heading will later show the calculated score.
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions q uestions correctly!",
            ),

            // Add 30 logical pixels of vertical space before the summary.
            const SizedBox(height: 30),

            // Replace the placeholder text with the custom summary widget.
            // Parentheses are important here: `getSummaryData()` executes the
            // method and passes its returned List<Map<String, Object>> to the
            // QuestionsSummary constructor. Without parentheses, this would
            // pass the function itself, but QuestionsSummary expects the list
            // produced by that function.
            QuestionsSummary(summaryData),

            // Separate the summary list from the restart button.
            const SizedBox(height: 30),

            // TextButton displays the restart label. Its callback is currently
            // empty, so pressing it does nothing until restart logic is added.
            TextButton(onPressed: () {}, child: const Text('Restart Quiz!')),
          ],
        ),
      ),
    );
  }
}
