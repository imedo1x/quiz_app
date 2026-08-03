// Represents one quiz question together with all of its possible answers.
class QuizQuestion {
  // `text` and `answers` are required positional arguments. The const
  // constructor allows a QuizQuestion to be created as a compile-time constant
  // when both supplied values are also constant.
  const QuizQuestion(this.text, this.answers);

  // The question shown to the user.
  final String text;

  // The possible answers. In this app's question data, the first item is kept
  // as the correct answer before the answers are shuffled for display.
  final List<String> answers;

  // Return the answers in a random order without changing the original list.
  List<String> getShuffledAnswers() {
    // List.of creates a separate, mutable copy. Calling shuffle directly on
    // `answers` would change the stored order and lose the reliable position of
    // the correct answer.
    final shuffledList = List.of(answers);

    // shuffle rearranges this copied list in place using a random order.
    shuffledList.shuffle();

    // Give the shuffled copy to the question screen for rendering.
    return shuffledList;
  }
}
