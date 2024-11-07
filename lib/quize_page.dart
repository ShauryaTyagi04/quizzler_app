import 'package:flutter/material.dart';
import 'package:quizzler_app/alert.dart';
import 'package:quizzler_app/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
AlertWarning alertWarning = AlertWarning();

List<Widget> _scoreKeeper = [
];

class QuizPage extends StatefulWidget {

  @override
  State<QuizPage> createState() => _QuizPageState();

  void clearScore(){
    _scoreKeeper.clear();
  }
}

class _QuizPageState extends State<QuizPage> {

  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState((){
      if (userPickedAnswer == correctAnswer){
        _scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
        alertWarning.incrementCorrectAnswers();
      }else{
        _scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
      }

      quizBrain.nextQuestion(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child:Padding(padding: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.white,
                  ),
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
              ),
            )
        ),
        Expanded(
            child:Padding(padding: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.white,
                  ),
                  child: Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
              ),
            )
        ),
        Row(
          children: _scoreKeeper,
        ),
      ],
    );
  }

}

