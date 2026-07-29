import 'package:flutter/material.dart';

// Imports the shared list of quiz questions so this file can determine when
// the user has answered every question.
import 'package:quiz_app/data/questions.dart';

// Imports the screen that displays questions and reports selected answers
// through its onSelectAnswer callback.
import 'package:quiz_app/questions_screen.dart';

// These local imports provide the opening screen and the final results screen.
import 'start_screen.dart';
import 'results_screen.dart';

// Quiz is the root widget that controls the app's three screens.
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

// The leading underscore makes _QuizState private to this Dart library.
class _QuizState extends State<Quiz> {
  // Stores answers in the same order in which the questions are answered.
  // The list starts empty and grows by one item after every selection.
  List<String> selectedAnswers = [];

  // Holds whichever complete screen should currently appear inside the app.
  // It is nullable because it has no value until initState initializes it.
  Widget? activeScreen;

  @override
  void initState() {
    // StartScreen receives the switchScreen method as a callback. It can invoke
    // that callback when the user presses the button to begin the quiz.
    activeScreen = StartScreen(switchScreen);

    super.initState();
  }

  // Changes the active content from the start screen to the questions screen.
  void switchScreen() {
    setState(() {
      // QuestionsScreen receives chooseAnswer as a callback, so it can send the
      // selected answer back to this parent state.
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  // This callback runs whenever QuestionsScreen reports a selected answer.
  void chooseAnswer(String answer) {
    // Append the new answer so its list index continues to match the question
    // index. Updating this list alone does not require an immediate rebuild.
    selectedAnswers.add(answer);

    // Once the number of answers equals the number of questions, the quiz is
    // complete and the app can move to the results screen.
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // Keep `selectedAnswers` intact when switching to the results screen.
        // ResultsScreen needs the completed list to build one summary entry
        // for every question. Clearing it here would pass an empty list and no
        // summary rows would be displayed. The list should instead be cleared
        // later when the user actually restarts the quiz.
        activeScreen = ResultsScreen(chosenAnswers: selectedAnswers);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Scaffold provides the basic visual page structure.
      home: Scaffold(
        // The body fills the main content area of the Scaffold.
        body: Container(
          // BoxDecoration paints a background behind the active screen.
          decoration: const BoxDecoration(
            // LinearGradient blends between the two colors along a straight
            // line from the top-left corner to the bottom-right corner.
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 92, 45, 172),
                Color.fromARGB(255, 143, 92, 230),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Because activeScreen changes through setState, this child displays
          // StartScreen, QuestionsScreen, or ResultsScreen at the proper time.
          // Container accepts a nullable child, matching Widget?.
          child: activeScreen,
        ),
      ),
    );
  }
}
