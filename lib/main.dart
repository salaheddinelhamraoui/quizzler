import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Quizzler(),
        ),
      ),
    );

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  int i = 0;
  List<Widget> iconsList = [];

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
                quizBrain.getQuestionText(i),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    bool correctAnswer = quizBrain.getCorrectAnswer(i);

                    if (correctAnswer == true) {
                      iconsList.add(Icon(Icons.check, color: Colors.green));
                    } else {
                      iconsList.add(Icon(Icons.close, color: Colors.red));
                    }
                    if (i == quizBrain.getLength() - 1) {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Done.",
                        desc: "Your score is : 6 !",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Repeat",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();

                      i = 0;
                      iconsList.clear();
                    } else {
                      i++;
                    }
                  });
                },
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    bool correctAnswer = quizBrain.getCorrectAnswer(i);

                    if (correctAnswer == false) {
                      iconsList.add(Icon(Icons.check, color: Colors.green));
                    } else {
                      iconsList.add(Icon(Icons.close, color: Colors.red));
                    }
                    if (i == quizBrain.getLength() - 1) {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Done.",
                        desc: "Your score is : 6 !",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Repeat",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();

                      i = 0;
                      iconsList.clear();
                    } else {
                      i++;
                    }
                  });
                },
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )),
          ),
        ),
        Row(children: iconsList)
      ],
    );
  }
}

/*
question1: '', false,
question2: '', true,
question3: , true,
*/
