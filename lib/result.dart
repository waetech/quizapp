import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultPhrase{
    String resultText;

    if(resultScore >= 300) {
      resultText = 'You are on your way to being a great developer!';
    } else if (resultScore >= 250) {
      resultText = 'Practice more!';
    } else if (resultScore < 100) {
      resultText = 'Find another profession';
    } else {
      resultText = 'Keep up the good work!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
      resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,),
    );
  }
}
