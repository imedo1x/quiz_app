# Flutter Quiz App

A small, cross-platform Flutter quiz app for learning core Flutter concepts. It presents randomized multiple-choice answers, tracks the user's selections, calculates the final score, and displays a question-by-question results summary.

![Quiz app logo](assests/images/quiz-logo.png)

## Features

- Intro screen with a custom image and Google Fonts styling
- Six multiple-choice questions about Flutter
- Randomized answer order for every question
- Score calculation after the final answer
- Scrollable summary showing the selected and correct answers
- Responsive Flutter UI for Android, iOS, web, Windows, macOS, and Linux

## Built With

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [Google Fonts](https://pub.dev/packages/google_fonts)

## Getting Started

### Prerequisites

Install the [Flutter SDK](https://docs.flutter.dev/get-started/install) and verify your environment:

```bash
flutter doctor
```

### Installation

1. Clone the repository and enter its directory.
2. Install the dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app on an available device:

   ```bash
   flutter run
   ```

To select a specific target, list the available devices and pass its ID:

```bash
flutter devices
flutter run -d <device-id>
```

## Project Structure

```text
lib/
|-- main.dart                 # App entry point
|-- quiz.dart                 # Screen flow and selected-answer state
|-- start_screen.dart         # Intro screen
|-- questions_screen.dart     # Question and answer UI
|-- results_screen.dart       # Score and results screen
|-- questions_summary.dart    # Detailed answer summary
|-- answer_button.dart        # Reusable answer button
|-- data/
|   `-- questions.dart        # Quiz content
`-- model/
    `-- quiz_question.dart    # Question data model and answer shuffling
```

## Customizing the Questions

Edit `lib/data/questions.dart` to add or change quiz content. The first answer in each list must be the correct answer; the app creates a shuffled copy before displaying the choices.

```dart
QuizQuestion('Your question?', [
  'Correct answer',
  'Incorrect answer',
  'Another incorrect answer',
  'One more incorrect answer',
]),
```

## Current Limitation

The results screen includes a **Restart Quiz** button, but its callback has not been implemented yet.