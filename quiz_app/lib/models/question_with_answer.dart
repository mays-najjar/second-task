import 'package:flutter/material.dart';

class QuestionWithAnswer {
  final String question;
  final List<Answer> answers;
  final String correctAnswer;
  QuestionWithAnswer(
      {required this.question,
      required this.answers,
      required this.correctAnswer});
}

class Answer {
  final String text;
  final IconData icon;
  final bool correct;
  Answer({required this.text, required this.icon, required this.correct});
}

// build data
List<QuestionWithAnswer> questionsWithAnswers = [
  QuestionWithAnswer(
    question: 'Whats your favorite Country?',
    answers: [
      Answer(text: 'Japan', icon: Icons.travel_explore, correct: false),
      Answer(text: 'USA', icon: Icons.flag, correct: false),
      Answer(text: 'Spain', icon: Icons.travel_explore, correct: true),
      Answer(
          text: 'South Korea',
          icon: Icons.travel_explore_rounded,
          correct: false)
    ],
    correctAnswer: 'Spain',
  ),
  QuestionWithAnswer(
    question: 'Which one is your favorite transportation?',
    answers: [
      Answer(text: 'Car', icon: Icons.car_crash_rounded, correct: false),
      Answer(text: 'Plane', icon: Icons.airline_seat_flat, correct: false),
      Answer(text: 'Boat', icon: Icons.shape_line, correct: true),
      Answer(text: 'Van', icon: Icons.vaccines, correct: false)
    ],
    correctAnswer: 'Boat',
  ),
  QuestionWithAnswer(
      question: "Which one is your favorite sport?",
      answers: [
        Answer(
            text: 'Skydiving', icon: Icons.sports_hockey_sharp, correct: false),
        Answer(
            text: 'Paragliding',
            icon: Icons.sports_bar_outlined,
            correct: false),
        Answer(
            text: 'Bungee jumping', icon: Icons.bungalow_sharp, correct: true),
        Answer(text: 'Scape Room', icon: Icons.room, correct: false)
      ],
      correctAnswer: "Bungee jumping"),
  QuestionWithAnswer(
      question: 'What is your favorite food',
      answers: [
        Answer(text: 'Pizza', icon: Icons.local_pizza, correct: false),
        Answer(text: 'Tacos', icon: Icons.food_bank, correct: false),
        Answer(text: "Sushi", icon: Icons.restaurant_menu, correct: true),
        Answer(text: 'Pasta', icon: Icons.paste_sharp, correct: false)
      ],
      correctAnswer: 'Sushi')
];
