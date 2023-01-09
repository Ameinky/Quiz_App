import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function()? resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 8) {
      resultText = "you are awesome and innocent";
    } else if (resultScore >= 12) {
      resultText = "Pretty likeable";
    } else if (resultScore >= 16) {
      resultText = "you are stringle";
    } else {
      resultText = "You are so Bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
              onPressed: resetHandler,
              child: Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.redAccent,
                ),
              ))
        ],
      ),
    );
  }
}
