import 'package:flutter/material.dart';

// A reusable button that displays one possible answer and reports taps to its
// parent widget.
class AnswerButton extends StatelessWidget {
  // `answerText` and `onTap` are named arguments because they appear inside
  // curly braces {}. `required` makes callers provide both values.
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  // The answer displayed as the button's label.
  final String answerText;

  // A callback supplied by the parent. It takes no arguments and returns no
  // value, and it runs when the user presses this button.
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    // Add a small vertical gap so neighboring answer buttons do not touch.
    return Container(
      margin: const EdgeInsets.only(bottom: 2, top: 2),
      child: ElevatedButton(
        // Pass the callback without parentheses so Flutter invokes it later in
        // response to a tap instead of during the build method.
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          // Add space inside the button around its text label.
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),

          // backgroundColor controls the button surface, while foregroundColor
          // is inherited by content such as its text and icons.
          backgroundColor: const Color.fromARGB(255, 77, 47, 87),
          foregroundColor: Colors.white,

          // The elevation creates a shadow that visually lifts the button away
          // from the background.
          elevation: 5,

          // Flutter provides many ShapeBorder classes for customizing buttons.
          // BeveledRectangleBorder creates clipped-looking corners, and the
          // radius controls the size of those corner bevels.
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
          ),
        ),

        // Display the answer supplied through the constructor.
        child: Text(answerText),
      ),
    );
  }
}
