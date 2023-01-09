import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_app/answers.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = const [
      {
        'questionText': 'what\ is your fovarite color?',
        'answers': [
          {'text': 'white', 'score': 9},
          {'text': 'blue', 'score': 7},
          {'text': 'red', 'score': 4},
          {'text': 'black', 'score': 21},
        ],
      },
      {
        'questionText': 'what\ is your fovarite Animals?',
        'answers': [
          {'text': 'Lion', 'score': 5},
          {'text': 'Goat', 'score': 1},
          {'text': 'Tiger', 'score': 6},
          {'text': 'Cat', 'score': 9},
        ],
      },
      {
        'questionText': 'what is your fivorite Instruction?',
        'answers': [
          {'text': 'Max', 'score': 4},
          {'text': 'Max', 'score': 5},
          {'text': 'Max', 'score': 6},
          {'text': 'Max', 'score': 9},
        ],
      },
    ];
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text('Quiz App'),
          elevation: 0,
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestions: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
