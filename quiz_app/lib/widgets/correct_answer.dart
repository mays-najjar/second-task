import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_with_answer.dart';
import 'package:quiz_app/utils/app_colors.dart';

class CorrectAnswer extends StatefulWidget {
  const CorrectAnswer({super.key});

  @override
  State<CorrectAnswer> createState() => _CorrectAnswerState();
}

class _CorrectAnswerState extends State<CorrectAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Correct Answers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questionsWithAnswers.length,
          itemBuilder: (context, index) {
            final question = questionsWithAnswers[index];
            final correctAnswer =
                question.answers.firstWhere((answer) => answer.correct).text;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.pink,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('Correct answer: $correctAnswer'),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
