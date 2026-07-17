import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }


  void switchScreen() {
    setState(() {
      activeScreen =  QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

 void chooseAnswer (String answer){
  selectedAnswers.add(answer);
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 92, 45, 172),
                Color.fromARGB(255, 143, 92, 230),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
