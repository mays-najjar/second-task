class QuestionWithAnswer {
  final String question;
  final List<String> answers;
  final String correctAnswer;
  const QuestionWithAnswer(
      {required this.question, required this.answers, required this.correctAnswer});
}

// build data
const List<QuestionWithAnswer> questionsWithAnswers = [
  QuestionWithAnswer(
      question: 'Whats your favorite Country?',
      answers: ['Japan', 'Canada', 'Spain'],
      correctAnswer: 'Spain'),
  QuestionWithAnswer(
      question: 'Which one is your favorite transportation?',
      answers: ['Car', 'Plane', 'Boat'],
      correctAnswer: 'Car'),
  QuestionWithAnswer(
    question:
        "Which extreme sport involves jumping off a tall structure with a bungee cord?",
    answers: ["Skydiving", "Paragliding", "Bungee jumping"],
    correctAnswer: "Bungee jumping"
  ),
  QuestionWithAnswer(
  question: 'What is your favorite food',
   answers: ['pizza', 'burger', 'shawrma'],
    correctAnswer: 'burger')
];
