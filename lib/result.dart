import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;
  // ignore: use_key_in_widget_constructors
  const Result(this.totalScore, this.resetHandler);

  String get resultPhrase {
    String resultPhraseText = 'You are done';
    if (totalScore < 100) {
      resultPhraseText = 'you are innocent';
    } else {
      resultPhraseText = 'You are bad ass';
    }
    return resultPhraseText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed:()=>resetHandler(), 
          child: const Text('Reset Quiz'),
        ),
      ],
    ));
  }
}
