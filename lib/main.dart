import 'package:flutter/material.dart';


import './quiz.dart';
import './result.dart';

void main(){
 runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {'questionText': 'How do you feel about programming?', 'answers': [
      {'text': 'Super Excited', 'score':  100},
      {'text': 'Motivated', 'score': 80},
      {'text': 'Somewhat excited', 'score': 40},
      {'text': 'Okay', 'score': 10},
    ],},
    {'questionText': 'How often do you practice coding?', 'answers': [
      {'text': 'Everyday if I could', 'score': 100},
      {'text': 'Every other day', 'score': 80},
      {'text': 'A few days here and there', 'score': 30},
      {'text': 'When I get the chance', 'score': 20},
    ],},
    {'questionText': 'What are your goals in the next 3-5 months?', 'answers': [
      {'text': 'To get a job as a Software Engineer', 'score': 100},
      {'text': 'To build a digital product', 'score': 90},
      {'text': 'To be a millionaire', 'score': 20},
      {'text': 'I don\'t, know', 'score': 10},
    ],},
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
