import 'package:flutter/material.dart';

import 'Backend.dart';
import 'HomePage.dart';

class Try extends StatefulWidget {
  @override
  _TryState createState() => _TryState();
}

class _TryState extends State<Try> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  // Define an empty list to store the quiz data fetched from the server
  List<Map<String, dynamic>> _quizData = [];

  // Variable to store the selected answer index for each question
  int? _selectedAnswerIndex;

  // Service instances for fetching questions and options
  DQuestion questionService = DQuestion();
  Option optionService = Option();

  @override
  void initState() {
    super.initState();
    _fetchQuizData();
  }

  // Function to fetch quiz data from the server
  void _fetchQuizData() async {
    try {
      var data = await questionService.postAllQuestion();

      // Ensure that the data is a List<dynamic> before processing
      if (data is List<dynamic>) {
        var questions = data.cast<Map<String, dynamic>>();

        // Fetch options for each question
        for (var question in questions) {
          var options = await optionService.getOptions(question['id']);
          question['options'] = options;

          // Find the index of the correct answer in the options list
          var correctAnswer = question['correct_ans'];
          var correctAnswerIndex =
              options.indexWhere((option) => option['option'] == correctAnswer);
          question['correctAnswer'] = correctAnswerIndex;
        }

        setState(() {
          _quizData = questions;
        });
      } else {
        // Handle the case when the data format is not as expected
        print('Invalid data format');
      }
    } catch (error) {
      print('Error fetching quiz data: $error');
      // Handle error as needed (e.g., show an error message to the user)
    }
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _quizData.length - 1) {
        _currentQuestionIndex++;
        _selectedAnswerIndex =
            null; // Reset the selected answer for the new question
      } else {
        // Show the final score and reset the quiz
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text('Quiz Finished!'),
              content: Text('Your Score: $_score'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _currentQuestionIndex = 0;
                      _score = 0;
                      _selectedAnswerIndex =
                          null; // Reset selected answer for restart
                    });
                  },
                  child: Text('Restart Quiz'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void _showResultDialog(
    bool isCorrect,
    String selectedAnswer,
    String correctAnswer,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: isCorrect ? Text('Correct!') : Text('Incorrect!'),
          content: isCorrect
              ? Text('You answered correctly. Great job!')
              : Text(
                  'Oops, your answer ($selectedAnswer) was incorrect. The correct answer is: $correctAnswer'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _nextQuestion();
              },
              child: Text('Next Question'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text('JEE Quiz Test'),
      ),
      body: _quizData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Hero(
                      tag: 'question_${_quizData[_currentQuestionIndex]['id']}',
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          'Question ${_currentQuestionIndex + 1}/${_quizData.length}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Hero(
                      tag:
                          'question_text_${_quizData[_currentQuestionIndex]['id']}',
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          _quizData[_currentQuestionIndex]['question'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Create a ListView of RadioListTiles for the options
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        _quizData[_currentQuestionIndex]['options'].length,
                    itemBuilder: (context, index) {
                      return RadioListTile(
                        value: index,
                        groupValue:
                            _selectedAnswerIndex, // Use the selected answer index
                        title: Text(
                          _quizData[_currentQuestionIndex]['options'][index]
                              ['option'],
                          style: TextStyle(fontSize: 18.0),
                        ),
                        onChanged: (value) {
                          int? selectedAnswerIndex = value;
                          int correctAnswerIndex =
                              _quizData[_currentQuestionIndex]['correctAnswer'];

                          // Compare the selected answer index with the correct answer index
                          bool isCorrect =
                              selectedAnswerIndex == correctAnswerIndex;

                          // Update score
                          if (isCorrect) {
                            setState(() {
                              _score++;
                            });
                          }

                          // Get the selected answer text and the correct answer text
                          String selectedAnswer =
                              _quizData[_currentQuestionIndex]['options']
                                  [selectedAnswerIndex]['option'];
                          String correctAnswer =
                              _quizData[_currentQuestionIndex]['options']
                                  [correctAnswerIndex]['option'];

                          // Show the result dialog
                          _showResultDialog(
                              isCorrect, selectedAnswer, correctAnswer);

                          // Don't call _nextQuestion() here, wait for the dialog to be dismissed
                          // and let the user click on 'Next Question' button.

                          setState(() {
                            _selectedAnswerIndex = selectedAnswerIndex;
                          });
                        },
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    child: Text(
                      _currentQuestionIndex < _quizData.length - 1
                          ? 'Next Question'
                          : 'Finish',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Score: $_score',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:projectui/HomePage.dart';

import 'Backend.dart';

class Try extends StatefulWidget {
  @override
  _TryState createState() => _TryState();
}

class _TryState extends State<Try> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  // Replace the following list with your actual quiz questions and options
  List<Map<String, dynamic>> _quizData = [
    {
      'question': 'What is the capital of France?',
      'options': ['New York', 'London', 'Paris', 'Berlin'],
      'correctAnswer': 2,
    },
    {
      'question': 'What is the symbol for Hydrogen?',
      'options': ['O', 'H', 'He', 'N'],
      'correctAnswer': 1,
    },
    // Add more questions here...
  ];

  void _showResultDialog(bool isCorrect) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: isCorrect ? Text('Correct!') : Text('Incorrect!'),
          content: isCorrect
              ? Text('You answered correctly. Great job!')
              : Text('Oops, your answer was incorrect. Try again!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _nextQuestion();
              },
              child: Text('Next Question'),
            ),
          ],
        );
      },
    );
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _quizData.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Show the final score and reset the quiz
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text('Quiz Finished!'),
              content: Text('Your Score: $_score'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _currentQuestionIndex = 0;
                      _score = 0;
                    });
                  },
                  child: Text('Restart Quiz'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.back_hand),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: Text('JEE Quiz Test'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_quizData.length}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              _quizData[_currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            // Create a ListView of RadioListTiles for the options
            ListView.builder(
              shrinkWrap: true,
              itemCount: _quizData[_currentQuestionIndex]['options'].length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  value: index,
                  groupValue:
                      null, // You can use this to check the selected option.
                  title: Text(
                    _quizData[_currentQuestionIndex]['options'][index],
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onChanged: (value) {
                    // You can check if the selected option is correct or not here.
                    bool isCorrect = value ==
                        _quizData[_currentQuestionIndex]['correctAnswer'];
                    setState(() {
                      if (isCorrect) {
                        _score++;
                      }
                    });
                    _showResultDialog(isCorrect);
                  },
                );
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _nextQuestion,
              child: Text(
                _currentQuestionIndex < _quizData.length - 1
                    ? 'Next Question'
                    : 'Finish',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Score: $_score',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
*/
