import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_with_answer.dart';
import 'package:quiz_app/utils/app_colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIndex = 0;
  int score = 0;
  bool isFinished = false;
  void answerQuestion() {
    debugPrint('Answer Chosen');
  }

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
        child: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
              // main for y axis, cross for x axis
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!isFinished) ...[
                  Text(
                    questionsWithAnswers[questionIndex].question,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
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
                          (answer) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: answerButton(
                              text: answer,
                              onPressed: () {
                                setState(() {
                                  final questionObj =
                                      questionsWithAnswers[questionIndex];
                                  if (answer == questionObj.correctAnswer) {
                                    score++;
                                  }
                                  if (questionIndex <
                                      questionsWithAnswers.length - 1) {
                                    questionIndex++;
                                  } else {
                                    isFinished = true;
                                  }
                                });
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
                if (isFinished) ...[
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Text(
                        'Congrats! Your final score is $score / ${++questionIndex}',
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 24,
                          color: Color.fromARGB(255, 104, 57, 31),
                          fontFamily: 'Times New Roma',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // Button to restart the quiz after it's finished
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        questionIndex = 0;
                        score = 0;
                        isFinished = false;
                      });
                    },
                    child: const Text('Restart'),
                  ),
                ]
              ]),
        ),
      ),
    );
    /*  return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Your Score'),
          backgroundColor: const Color.fromARGB(223, 240, 140, 83),
          foregroundColor: const Color.fromARGB(223, 20, 22, 22),
        ),
        body: Center(
          child: SizedBox(
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Congrats! Your final score is $questionIndex / $questionIndex',
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 24,
                  color: Color.fromARGB(255, 104, 57, 31),
                  fontFamily: 'Times New Roma',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );*/
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
