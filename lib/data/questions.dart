// Import the QuizQuestion model from the neighboring model directory. The `..`
// moves up from `data` to `lib` before entering `model`.
import '../model/quiz_question.dart';

// Store all quiz content in one top-level list so the question and results
// screens can use the same ordered source of data.
//
// Because the list is const, its entries cannot be added, removed, or replaced
// at runtime. Each QuizQuestion is also created as a constant automatically
// because it appears inside this constant collection.
//
// Important: the first answer in every answer list is the correct answer. The
// question screen displays a shuffled copy, while the results screen uses index
// zero from this original list to check the user's answer.
const questions = [
  // Each QuizQuestion receives the question text first and its possible answer
  // Strings second through the model's positional constructor.
  QuizQuestion('What are the main building blocks of Flutter UIs?', [
    'Widgets',
    'Components',
    'Blocks',
    'Functions',
  ]),
  QuizQuestion('How are Flutter UIs built?', [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  // The backslash escapes the apostrophe so it remains part of a String that
  // is itself surrounded by single quotation marks.
  QuizQuestion('What\'s the purpose of a StatefulWidget?', [
    'Update UI as data changes',
    'Update data as UI changes',
    'Ignore data changes',
    'Render UI that does not depend on data',
  ]),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion('What happens if you change data in a StatelessWidget?', [
    'The UI is not updated',
    'The UI is updated',
    'The closest StatefulWidget is updated',
    'Any nested StatefulWidgets are updated',
  ]),
  QuizQuestion('How should you update data inside of StatefulWidgets?', [
    'By calling setState()',
    'By calling updateData()',
    'By calling updateUI()',
    'By calling updateState()',
  ]),
];
