import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_with_answer.dart';
import 'package:quiz_app/utils/app_colors.dart';

class AnswerWidgetItem extends StatelessWidget {
  final Answer answer;
  final bool? isCorrect;
  final String? selectedAnswer;
  final VoidCallback onTap;
  const AnswerWidgetItem(
      {super.key,
      required this.answer,
      required this.isCorrect,
      required this.selectedAnswer,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: (selectedAnswer == answer.text && answer.correct)
                ? AppColors.green
                : (selectedAnswer == answer.text && !answer.correct)
                    ? AppColors.red
                    : (answer.correct &&
                            selectedAnswer != answer.text &&
                            selectedAnswer != null)
                        ? AppColors.green
                        : AppColors.white,
            border: Border.all(color: AppColors.grey.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(answer.icon,
                        color: selectedAnswer == answer.text
                            ? AppColors.white
                            : AppColors.black),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      answer.text,
                      style: TextStyle(
                          color: selectedAnswer == answer.text
                              ? AppColors.white
                              : AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Container(
                  height: 20,
                  alignment: Alignment.bottomRight,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: selectedAnswer == answer.text
                              ? AppColors.white
                              : AppColors.black)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
