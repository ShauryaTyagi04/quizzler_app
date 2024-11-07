import 'package:flutter/material.dart';
import 'package:quizzler_app/quiz_brain.dart';
import 'package:quizzler_app/quize_page.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: QuizPage(),
            )
        ),
      ),
    );
  }
}

