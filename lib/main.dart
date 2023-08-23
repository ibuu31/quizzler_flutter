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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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

class _QuizPageState extends State<QuizPage> {
  //icons will be added after on pressing after comparing your answers.
  List<Widget> scoreKeeper = [];
  //this is question list.
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'Walt Disney holds the record for the most Oscars',
    '\'A\' is the most common letter used in the English language',
    'Coffee is made from berries',
    'The small intestine is about three-and-a-half times the length of your body',
    'Fish cannot blink',
    'Hot and cold water sound the same when poured.',
    'When the two numbers on opposite sides of a dice are added together it always equals 7.',
  ];
  //this is answer list.
  List<bool> answers = [
    false,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    false,
    true,
  ];
  int quesNum = 0;
  // initializing counter because it will show your score.
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    // question number will not exceed 10. After attempting 10th question, score will be seen.
    // the condition here is like, if quesNum is less than 10, it will return Column widget, else center widget will be returned.
    return quesNum < 10
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //this widget is for displaying questions, and it will take 5 out of 6 space on screen.
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      questions[quesNum],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // true button.
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        if (answers.elementAt(quesNum) == true) {
                          scoreKeeper.add(const Icon(
                            Icons.check,
                            color: Colors.green,
                          ));
                          counter++;
                        } else {
                          scoreKeeper.add(const Icon(
                            Icons.close,
                            color: Colors.red,
                          ));
                        }
                        quesNum++;
                      });
                    },
                    child: const Text(
                      'True',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              // false button.
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        if (answers.elementAt(quesNum) == false) {
                          scoreKeeper.add(const Icon(
                            Icons.check,
                            color: Colors.green,
                          ));
                          counter++;
                        } else {
                          scoreKeeper.add(const Icon(
                            Icons.close,
                            color: Colors.red,
                          ));
                        }
                        quesNum++;
                      });
                    },
                    child: const Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              // answer space that displays your answer status.
              Expanded(
                flex: 1,
                child: Row(
                  //scoreKeeper is a list.
                  children: scoreKeeper,
                ),
              ),
            ],
          )

        //after this line, your code will create a new page and show user their result.
        : Center(
            child: Text(
            'Your score is $counter',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ));
  }
}
