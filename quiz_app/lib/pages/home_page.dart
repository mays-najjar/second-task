import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_with_answer.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/widgets/answer_widget_item.dart';
import 'package:quiz_app/widgets/congrats_widget.dart';
import 'package:quiz_app/widgets/main_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIndex = 0;
  int score = 0;
  int c = 1;
  bool isFinished = false;
  bool isCorrect = false;
  String? selectedAnswer;
  void answerQuestion() {
    debugPrint('Answer Chosen');
  }

  int length = questionsWithAnswers.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // scaffold here is the base of design the page
      /*  appBar: AppBar(
        centerTitle: true,
        title: const Text('Quiz App'),
        backgroundColor: const Color.fromARGB(225, 30, 183, 189),
        //color of the bar at top
      ),*/
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: !isFinished
                ? Column(
                    // main for y axis, cross for x axis
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        questionsWithAnswers[questionIndex].question,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Step $c of $length',
                        style: const TextStyle(
                          color: AppColors.grey,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        height: .8,
                        width: MediaQuery.of(context).size.width * c / 4,
                        color: AppColors.pink,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Answer and get points',
                        style: TextStyle(
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: questionsWithAnswers[questionIndex]
                            .answers
                            .map(
                              (answer) => AnswerWidgetItem(
                                answer: answer,
                                isCorrect: isCorrect,
                                selectedAnswer: selectedAnswer,
                                onTap: () {
                                  setState(() {
                                    selectedAnswer = answer.text;
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                      const Spacer(),
                      MainButton(
                          text: 'Next',
                          onTap: () {
                            setState(() {
                              final questionObj =
                                  questionsWithAnswers[questionIndex];
                              if (selectedAnswer == questionObj.correctAnswer) {
                                score++;
                              }
                              if (questionIndex <
                                  questionsWithAnswers.length - 1) {
                                questionIndex++;
                                selectedAnswer = null;
                                c++;
                              } else {
                                isFinished = true;
                              }
                            });
                          })
                    ],
                  )
                : CongratsWidget(
                    score: score,
                    onTap: () {
                      setState(() {
                        questionIndex = 0;
                        score = 0;
                        isFinished = false;
                        c = 1;
                        selectedAnswer = null;
                      });
                    },
                  )),
      ),
    );
  }
}

Widget answerButton({required String text, required VoidCallback onPressed}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    ),
  );
}
