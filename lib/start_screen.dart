import 'package:flutter/material.dart';

// Provides ready-made Google Fonts that can be applied through a TextStyle.
import 'package:google_fonts/google_fonts.dart';

// Displays the quiz logo, introductory text, and the button that starts the
// quiz.
class StartScreen extends StatelessWidget {
  // `startQuiz` is a required positional argument. The parent widget supplies
  // the function that should run when the user presses the start button.
  const StartScreen(this.startQuiz, {super.key});

  // Stores a callback that takes no arguments and returns no value. Keeping the
  // quiz-starting logic in the parent lets this widget focus on presentation.
  final void Function() startQuiz;

  @override
  Widget build(context) {
    // Center positions the complete start-screen content in the available
    // horizontal and vertical space.
    return Center(
      child: Column(
        // Use only the vertical space needed by the children instead of
        // expanding the Column to the full height of the screen.
        mainAxisSize: .min,
        children: [
          // If a widget supports applying a transparent color directly, prefer
          // that option because it avoids the extra compositing work of wrapping
          // the widget in Opacity.
          Image.asset(
            "assests/images/quiz-logo.png",
            width: 300,
            // The alpha value of 150 makes the white image tint partially
            // transparent while keeping the RGB channels fully white.
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          // This is another way to create an opacity effect. However, Opacity
          // may require an intermediate rendering layer, which can be more
          // expensive when it is used frequently in a large interface.
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset("assests/images/quiz-logo.png", width: 300),
          // ),

          // Add vertical space between the logo and the introductory text.
          const SizedBox(height: 80),

          Text(
            'Learn flutter the fun way',
            // GoogleFonts.gluten creates a TextStyle that uses the Gluten font
            // while also applying the chosen color and size.
            style: GoogleFonts.gluten(
              color: const Color.fromARGB(255, 244, 207, 255),
              fontSize: 24,
            ),
          ),

          // Separate the introductory text from the start button.
          const SizedBox(height: 30),

          // OutlinedButton.icon combines a tappable outlined button with an
          // icon and text label.
          OutlinedButton.icon(
            // Passing the callback without parentheses lets Flutter call it
            // later when the user presses the button.
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              // Draw a two-pixel orange border around the button.
              side: const BorderSide(color: Colors.orange, width: 2),

              // لتعديل أبعاد الزر (Adjust the button's visual dimensions.)
              // Positive density values give the button more horizontal and
              // vertical space than the default density.
              visualDensity: const VisualDensity(
                horizontal: 2.0,
                vertical: 2.0,
              ),

              // This color is inherited by the button's icon and label.
              foregroundColor: Colors.white,
            ),
            // The arrow visually reinforces that pressing the button moves the
            // user forward into the quiz.
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start the quiz'),
          ),
        ],
      ),
    );
  }
}
