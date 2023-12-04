import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projectui/Quiz.dart';
import 'package:projectui/user_provider.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'main.dart';

class QuizPage extends StatefulWidget {
  final dynamic selectedSubtopics;

  QuizPage({required this.selectedSubtopics});
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> _quizData = [];
  Map<int, List<Map<String, dynamic>>> _quizOptions = {};
  int _currentQuestionIndex = 0;
  int _selectedOptionIndex = -1;
  int _score = 0;
  bool _isTimeout = false;

  @override
  void initState() {
    super.initState();
    _loadQuizData();
  }

  Future<void> _loadQuizData() async {
    final selectedSubtopics = widget.selectedSubtopics;
    if (selectedSubtopics is int){
      try {
        var response = await http.get(
          Uri.parse('$globalapi/api/questions/$selectedSubtopics/'),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);

          setState(() {
            _quizData = List<Map<String, dynamic>>.from(data['questions']);
          });

          data['questions'].forEach((question) {
            final int questionId = question['id'];
            _quizOptions[questionId] = [];
            data['options'].forEach((option) {
              if (option['questions'] == question['question']) {
                _quizOptions[questionId]?.add(option);
              }
            });
          });
        } else {
          throw Exception('Failed to load quiz data');
        }
      } catch (e) {
        print('Error loading quiz data: $e');
      }
    } else if (selectedSubtopics is List<int> && selectedSubtopics.isNotEmpty){
      final subtopicQueryString = selectedSubtopics.map((id) => 'subtopic_id=$id').join('&');
      print(subtopicQueryString);
      try {
        var response = await http.get(
          Uri.parse('$globalapi/api/questions/?$subtopicQueryString'),
          //  $globalapi/api/questions/?subtopic_id=1&subtopic_id=2&subtopic_id=3
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);

          setState(() {
            _quizData = List<Map<String, dynamic>>.from(data['questions']);
          });

          data['questions'].forEach((question) {
            final int questionId = question['id'];
            _quizOptions[questionId] = [];
            data['options'].forEach((option) {
              if (option['questions'] == question['question']) {
                _quizOptions[questionId]?.add(option);
              }
            });
          });
        } else {
          throw Exception('Failed to load quiz data');
        }
      } catch (e) {
        print('Error loading quiz data: $e');
      }
    }
    /*try {
      var response = await http.get(
        Uri.parse('$globalapi/api/questions/$selectedSubtopics/'),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        setState(() {
          _quizData = List<Map<String, dynamic>>.from(data['questions']);
        });

        data['questions'].forEach((question) {
          final int questionId = question['id'];
          _quizOptions[questionId] = [];
          data['options'].forEach((option) {
            if (option['questions'] == question['question']) {
              _quizOptions[questionId]?.add(option);
            }
          });
        });
      } else {
        throw Exception('Failed to load quiz data');
      }
    } catch (e) {
      print('Error loading quiz data: $e');
    }*/
  }

  void _showResultDialog(bool isCorrect) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: isCorrect ? Text('Correct!') : Text('Incorrect!'),
          content: isCorrect
              ? Text('You answered correctly. Great job!')
              :Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Oops, your answer was incorrect. Correct ans is ',
                  style: TextStyle(fontSize: 18.0),
                ),
                TextSpan(
                  text: '${_quizData[_currentQuestionIndex]['correct_ans']}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
          ,
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

  Future<void> _nextQuestion() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

// Access the email from the provider
    String? userEmail = userProvider.email;
    print(userEmail);

    final url = '$globalapi/total_quizz/';

    try {
      if (userEmail != null) {
        final email = userEmail;
        print(email);
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',// Send the user's email in the headers
          },
          body: jsonEncode({
            'User-Email': email,
            'IncrementQuestionsAttended': true, // Add this line to indicate an increment
          }),
        );

        if (response.statusCode == 200) {
          // Handle success
          print('Total quizzes attended updated successfully');
        } else {
          // Handle error
          print('Failed to update the total quizzes attended');
        }
      } else {
        // Handle the case where the user's email is not available (user is not logged in)
        print('User not authenticated, please log in');
      }
    } catch (e) {
      print('Error: $e');
    }

    setState(()  {
      if (_currentQuestionIndex < (_quizData?.length ?? 0) - 1) {
        _currentQuestionIndex++;
        _selectedOptionIndex = -1;
      } else {
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
                      _selectedOptionIndex = -1;
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

  void _handleTimeout() {
    setState(() {
      _isTimeout = true;
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Time Out!'),
          content: Text('Your time has run out.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _restartQuiz();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
                      },
                      child: Text('Back')),
                  Text('Restart Quiz'),

                ],
              ),
            ),
          ],
        );
      },
    );
  }
  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    bool confirmExit = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Exit Confirmation"),
          content: Text("Are you sure you want to exit?"),
          actions: <Widget>[
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop(false); // Close the dialog with false
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop(true); // Close the dialog with true
              },
            ),
          ],
        );
      },
    );

    return confirmExit ?? false; // Return false if the user dismisses the dialog
  }


  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _selectedOptionIndex = -1;
      _isTimeout = false; // Reset timeout flag
    });
    _loadQuizData();
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async { return await _showExitConfirmationDialog(context); },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Test'),
          leading: GestureDetector(
            onTap: (){
              _showExitConfirmationDialog(context);
            },
              child: Icon(Icons.arrow_back)
          ),
        ),
        body: _isTimeout
            ? Center(
          child: Text(
            'Time Out!',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        )
            : Column(
          children: [
            TimerWidget(onTimeout: _handleTimeout,),
            Builder(
              builder: (BuildContext context) {
            if (_quizData.isEmpty) {
              // Show a loading progress bar or any other loading indicator here
              return Center(
                child: CircularProgressIndicator(), // Replace this with your loading widget
              );
            } else {
              // Show the quiz UI when _quizData is not empty
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Question ${_currentQuestionIndex + 1}',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      _quizData.isNotEmpty
                          ? _quizData[_currentQuestionIndex]['question']
                          : 'Loading question...',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 16.0),
                    if (_quizOptions.containsKey(_quizData[_currentQuestionIndex]['id']))
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _quizOptions[_quizData[_currentQuestionIndex]['id']]!
                            .map<Widget>((option) {
                          return RadioListTile<int>(
                            value: _quizOptions[_quizData[_currentQuestionIndex]['id']]!
                                .indexOf(option),
                            groupValue: _selectedOptionIndex,
                            title: Text(
                              option['option'] ?? '',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _selectedOptionIndex = value!;
                                bool isCorrect =
                                    option['option'] == _quizData[_currentQuestionIndex]['correct_ans'];
                                if (isCorrect) {
                                  _score++;
                                }
                                _showResultDialog(isCorrect);
                              });
                            },
                          );
                        }).toList(),
                      ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _nextQuestion,
                      child: Text(
                        _currentQuestionIndex < (_quizData?.length ?? 0) - 1
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
              );
            }
      },
      ),
          ],
        ),

      ),
    );
  }
}
class TimerWidget extends StatefulWidget {
  final Function onTimeout;
  TimerWidget({required this.onTimeout});
  @override
  State<StatefulWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _timerDuration = 30; // Timer duration in seconds
  late Timer _timer;
  int _secondsRemaining = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = _timerDuration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          widget.onTimeout();

        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_secondsRemaining seconds',
      style: const TextStyle(fontSize: 20),
    );
  }
}
