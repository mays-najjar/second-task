import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_with_answer.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/widgets/correct_answer.dart';
import 'package:quiz_app/widgets/main_button.dart';

class CongratsWidget extends StatelessWidget {
  final int score;
  final VoidCallback onTap;
  const CongratsWidget({
    super.key,
    required this.score,
    required this.onTap,
  });
  final int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Image(image: AssetImage('assets/congrats.jpg')),
      const SizedBox(
        height: 80,
      ),
      Text(
        ' Your final score is $score / ${questionsWithAnswers.length}',
        style: const TextStyle(
          fontSize: 24,
          color: AppColors.pink,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(
        height: 80,
      ),

      MainButton(
        text: 'Show correct answers',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CorrectAnswer()),
          );
        },
      ),
      const Spacer(),
      // Button to restart the quiz after it's finished
      MainButton(text: 'Restart', onTap: onTap)
    ]);
  }
}
