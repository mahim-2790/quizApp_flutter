// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_1/quiz.dart';
import 'package:module_1/result.dart';

void main() {
  runApp(MyApp());
} // main

// void main() => runApp(MyApp()) this is if a function has one line of expression

// widget is a special type of class

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // ignore: non_constant_identifier_names
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText': 'what is your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 20},
        {'text': 'Yellow', 'score': 30},
        {'text': 'Green', 'score': 40},
      ],
    },
    {
      'questionText': 'what is your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 20},
        {'text': 'Snake', 'score': 30},
        {'text': 'Panda', 'score': 40},
        {'text': 'Lion', 'score': 50},
        {'text': 'Tiger', 'score': 60},
      ],
    },
    {
      'questionText': 'what is your favorite anime character?',
      'answers': [
        {'text': 'Daku', 'score': 10},
        {'text': 'Naruto', 'score': 20},
        {'text': 'Kirito', 'score': 30},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score.toInt();
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('My First App'),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(_totalScore, _resetQuiz)));
  } // build
} // MyApp
