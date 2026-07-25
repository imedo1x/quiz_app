import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
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
              // 1. `data['queation']` looks up the value stored under that key.
              //    Map values are accessed with square brackets and a key.
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
              //
              // IMPORTANT: results_screen.dart creates this value using the key
              // 'question_index', but this lookup currently says 'queation'.
              // Map keys must match exactly; otherwise this returns null and the
              // `as int` cast fails at runtime.
              Text(((data['queation'] as int) + 1).toString()),
            ],
          );
        },
        // `map()` returns an Iterable<Widget>. Column.children specifically
        // needs a List<Widget>, so `toList()` performs that conversion.
      ).toList(),
    );
  }
}
