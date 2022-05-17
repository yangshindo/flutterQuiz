import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

List<Widget> scoreList = [];
List<Widget> addList = [];
List questionList = ["1 + 1 = 2?", "2 - 1 = 4 ?", "4 + 4 = 8"];
List correctAnswersList = [1, 0, 1];

class _QuizPageState extends State<QuizPage> {
  int count = 0;
  var displayedQuestion = questionList[0];

  void questionCheck(userAnswer) {
    if (count < questionList.length) {
      if (userAnswer == correctAnswersList[count]) {
        addList.add(Icon(Icons.check, color: Colors.green));
        count += 1;
      } else {
        addList.add(Icon(Icons.close, color: Colors.red));
        count += 1;
      }
      print(count);
      print(addList);
      setState(() {
        scoreList = addList;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                displayedQuestion,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green, primary: Colors.white),
              onPressed: () {
                questionCheck(1);
              },
              child: Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red, primary: Colors.white),
              onPressed: () {
                questionCheck(0);
              },
              child: Text('False'),
            ),
          ),
        ),
        Row(
          children: scoreList,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
