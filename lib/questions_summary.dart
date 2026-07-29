import 'package:flutter/material.dart';

// QuestionsSummary is a reusable widget that displays all question-result
// records.
class QuestionsSummary extends StatelessWidget {
  // This is a positional constructor, so the summary data must be supplied as
  // the first argument.
  const QuestionsSummary(this.summaryData, {super.key});

  // `final` means the field is assigned once by the constructor and cannot be
  // replaced afterward.
  //
  // The outer List contains one entry per answered question. Each inner Map
  // stores named pieces of information about that question. The keys are
  // Strings, while Object allows the values to be either Strings or an int.
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // The outer Column places every generated question-summary Row below the
    // previous one, creating the complete vertical results list.
    return Column(
      // `children` requires a List<Widget>, but `summaryData` is a list of
      // maps. Therefore, each map must be transformed into a widget.
      children: summaryData.map(
        // The `map()` method runs this function once for every item in
        // `summaryData`. Dart automatically passes the current map into the
        // function as `data`.
        //
        // The method name `map()` means "transform each value". It is unrelated
        // to the `Map<String, Object>` data type used above.
        (data) {
          // Each summary entry becomes one Row.
          // Row arranges its child widgets horizontally, from left to right.
          return Row(
            children: [
              // Text requires a String, so the expression below performs four
              // operations before passing its result to Text:
              //
              // 1. `data['question_index']` looks up the value stored under
              //    that key. Map values are accessed with square brackets and
              //    a key, and the key must exactly match the one used when the
              //    map is created in results_screen.dart.
              //
              // 2. `as int` type-casts the Object value to an int. This is
              //    needed because Dart only knows that map values are Objects,
              //    even though we know this particular value should be a number.
              //
              // 3. `+ 1` changes the zero-based index used by Dart into a
              //    user-friendly question number that starts at 1.
              //
              // 4. `toString()` converts the resulting int to the String that
              //    the Text widget requires.
              Text(((data['question_index'] as int) + 1).toString()),
              // A Row can contain a Column. This nested layout keeps the
              // question number on the left while stacking the related text
              // vertically on the right.
              Column(
                children: [
                  // Each value in `data` has the general type Object because
                  // `summaryData` is a List<Map<String, Object>>. Text requires
                  // a String, so `as String` tells Dart the specific type stored
                  // under each of these keys.
                  Text(data['question'] as String),
                  // SizedBox inserts five logical pixels of vertical space
                  // between the question and its answers.
                  const SizedBox(height: 5),
                  // The answer selected by the user is displayed first.
                  Text(data['user_answer'] as String),
                  // The correct answer is displayed below the user's answer so
                  // the two values can be compared.
                  Text(data['correct_answer'] as String),
                ],
              ),
            ],
          );
        },
        // `map()` returns an Iterable<Widget>. Column.children specifically
        // needs a List<Widget>, so `toList()` performs that conversion.
      ).toList(),
    );
  }
}
