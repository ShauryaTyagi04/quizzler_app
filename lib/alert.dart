import 'package:flutter/material.dart';
import 'package:quizzler_app/quiz_brain.dart';
import 'package:quizzler_app/quize_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizPage quizPage = QuizPage();
 QuizBrain quizBrain = QuizBrain();

int _correctAnswers = 0;

class AlertWarning{
  int totalQuestions = quizBrain.getQuestionLength();

  void resetAlert(BuildContext ctx){
    Alert(
      style: AlertStyle(
        animationType: AnimationType.grow,
        isCloseButton: true,
      ),
      content: Center(
        child: Column(
          children: [
            Text(
              '$_correctAnswers'
            ),
            const SizedBox(
              height: 20,
              width: 100,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Text(
                '$totalQuestions'
            )
          ],
        ),
      ),
      context: ctx,
      type: AlertType.success,
      title: "Quiz Completed",
      buttons: [
        DialogButton(
          child: Text(
            "RETAKE",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
              _correctAnswers =0;

              Navigator.pop(ctx);
          },
          width: 120,
        )
      ],
    ).show();
  }
  void incrementCorrectAnswers() {
    _correctAnswers++;
  }
}



