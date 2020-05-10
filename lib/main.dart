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
    {'questionText': 'What\'s your favorite color?', 'answers': [
      'Black', 'Red', 'Green', 'White'
    ],},
    {'questionText': 'What\'s your favorite animal', 'answers': [
      'Cat', 'Dog', 'Rabbit', 'Bird'
    ],},
    {'questionText': 'What is your favorite music?', 'answers': [
      'Jazz', 'Rock', 'Indie', 'Folk'
    ],},
  ];

  var _questionIndex = 0;

  void _answerQuestion() {


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
            ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions)
            : Result(),
      ),
    );
  }
}
