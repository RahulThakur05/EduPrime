import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectui/question.dart';
import 'package:projectui/tryerror.dart';

import 'Course.dart';
import 'Quiz.dart';

class MathsQuiz extends StatefulWidget {
  const MathsQuiz({Key? key}) : super(key: key);

  @override
  _MathsQuizState createState() => _MathsQuizState();
}

class _MathsQuizState extends State<MathsQuiz> {
  int expandedContainerIndex = 1; // Initially set no container as expanded

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildExpandableContainer(
              containerIndex: 1,
              containerExpanded: expandedContainerIndex == 1,
              containerHeader: 'Maths',
              containerColor: Colors.greenAccent,
              backgroundImage: 'assets/images/maquiz.jpg',
              listTiles: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: isLargeScreen ? 30 : 20),
                        child: Text(
                          "Practice a specific topic",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20, vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title:  Row(
                            children: [
                              Text(
                                "1",
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Sets, Relation, and Functions",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: const Text("Start"),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(192, 192, 192, 1.0),
                        height: 1,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20, vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title:  Row(
                            children: [
                              Text(
                                "2",
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Complex number and quadratic Equations",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet2(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: const Text("Start"),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(192, 192, 192, 1.0),
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20, vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title:  Row(
                            children: [
                              Text(
                                "3",
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Matrices and Determinants",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet3(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: const Text("Start"),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(192, 192, 192, 1.0),
                        height: 1,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20, vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title:  Row(
                            children: [
                              Text(
                                "4",
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Permutations and Combinations",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                               _showModalBottomSheet4(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: const Text("Start"),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(192, 192, 192, 1.0),
                        height: 1,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20, vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title:  Row(
                            children: [
                              Text(
                                "5",
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Mathematical Induction",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet5(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: const Text("Start"),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(192, 192, 192, 1.0),
                        height: 1,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20, vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title:  Row(
                            children: [
                              Text(
                                "6",
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Binomial Theorem and its Simple Applications",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // _showModalBottomSheet6(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: const Text("Start"),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(192, 192, 192, 1.0),
                        height: 1,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20, vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title:  Row(
                            children: [
                              Text(
                                "7",
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Sequence and Series",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet7(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: const Text("Start"),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(192, 192, 192, 1.0),
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20, vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title:  Row(
                            children: [
                              Text(
                                "8",
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Limit, Continuity and Differentiability",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet8(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: const Text("Start"),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(192, 192, 192, 1.0),
                        height: 1,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20, vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title:  Row(
                            children: [
                              Text(
                                "9",
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Integral Calculus",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet8(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: const Text("Start"),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(192, 192, 192, 1.0),
                        height: 1,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20, vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title:  Row(
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Differential Equations",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet8(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            child: const Text("Start"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExpandableContainer({
    required int containerIndex,
    required bool containerExpanded,
    required String containerHeader,
    required Color containerColor,
    required String backgroundImage,
    required List<Widget> listTiles,
    double width = 200,
    double height = 300,
    double opacity = 1.0,
  }) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          opacity: opacity,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (expandedContainerIndex == containerIndex) {
                  expandedContainerIndex =
                  -1; // Collapse the expanded container
                } else {
                  expandedContainerIndex = containerIndex;
                }
              });
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: containerColor.withOpacity(0.7),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.0),
                ),
              ),
              child: Text(
                containerHeader,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          if (containerExpanded)
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white.withOpacity(0.7),
              child: Column(
                children: listTiles,
              ),
            ),
        ],
      ),
    );
  }
}

void _showModalBottomSheet(BuildContext context) {
  final List<bool> _isChecked = [false];
  final List<bool> _checkedStates = List<bool>.generate(
    3,
        (_) => false,
  );

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 25.0,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text("Sets, Relation and Function"),
                                subtitle: Text("3 concepts * 687 question"),
                              ),
                              CheckboxListTile(
                                title: const Text(
                                  'Select All',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                value: _isChecked[0],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked[0] = value ?? false;
                                    for (int i = 0;
                                    i < _checkedStates.length;
                                    i++) {
                                      _checkedStates[i] = _isChecked[0];
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '1  Operations on Sets',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[0],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[0] = value ?? false;
                                if (value == true) {
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '2  Relations',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[1],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[1] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[2] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '3  Functions',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[2],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[2] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _checkedStates.contains(true)
                      ? () {
                    // Handle button press for starting the test
                    if (_isChecked[0]) {
                      // Navigate to page for "Select All" chapter
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(selectedSubtopics: [9, 10, 11]),
                        ),
                      );
                    }else if (_checkedStates[0]) {
                      // Navigate to page for "Units & Dimensions" chapter
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(selectedSubtopics: 9),
                        ),
                      );
                    }  else if (_checkedStates[1]) {
                      // Navigate to page for "Units & Dimensions" chapter
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(selectedSubtopics: 10),
                        ),
                      );
                    } else if (_checkedStates[2]) {
                      // Navigate to page for "Experimental Physics" chapter
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(selectedSubtopics: 11),
                        ),
                      );
                    }
                  }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.cyan;
                      },
                    ),
                  ),
                  child: const Text("Start Test"),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

void _showModalBottomSheet2(BuildContext context) {
  final List<bool> _isChecked = [false];
  final List<bool> _checkedStates = List<bool>.generate(
    5,
        (_) => false,
  );

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 25.0,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text("Complex Numbers & Quadratic Equations"),
                                subtitle: Text("3 concepts * 687 question"),
                              ),
                              CheckboxListTile(
                                title: const Text(
                                  'Select All',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                value: _isChecked[0],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked[0] = value ?? false;
                                    for (int i = 0;
                                    i < _checkedStates.length;
                                    i++) {
                                      _checkedStates[i] = _isChecked[0];
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '1  Algebra of Complex Numbers',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[0],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[0] = value ?? false;
                                if (value == true) {
                                  _checkedStates[1] = false;
                                  _checkedStates[4] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '2  Argand Plane and Polar ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[1],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[1] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '3  Quadratic System',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[2],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[2] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[3] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '4  Quadratic Inequalities',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[3],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[3] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '5  Quadratic Factored Form',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[4],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[4] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _checkedStates.contains(true)
                      ? () {
                    // Handle button press for starting the test
                  }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.cyan;
                      },
                    ),
                  ),
                  child: const Text("Start Test"),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

void _showModalBottomSheet3(BuildContext context) {
  final List<bool> _isChecked = [false];
  final List<bool> _checkedStates = List<bool>.generate(
    4,
        (_) => false,
  );

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 25.0,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text("Matrices and Determinants"),
                                subtitle: Text("3 concepts * 687 question"),
                              ),
                              CheckboxListTile(
                                title: const Text(
                                  'Select All',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                value: _isChecked[0],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked[0] = value ?? false;
                                    for (int i = 0;
                                    i < _checkedStates.length;
                                    i++) {
                                      _checkedStates[i] = _isChecked[0];
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              "1  Matrices and it's Type",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[0],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[0] = value ?? false;
                                if (value == true) {
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '2  Inverse & Transpose of Matrix',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[1],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[1] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '3  Determinant',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[2],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[2] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[3] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '4  Determinant of a Matrix',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[3],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[3] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _checkedStates.contains(true)
                      ? () {
                    // Handle button press for starting the test
                  }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.cyan;
                      },
                    ),
                  ),
                  child: const Text("Start Test"),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

void _showModalBottomSheet4(BuildContext context) {
  final List<bool> _isChecked = [false];
  final List<bool> _checkedStates = List<bool>.generate(
    4,
        (_) => false,
  );

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 25.0,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text("Waves"),
                                subtitle: Text("3 concepts * 687 question"),
                              ),
                              CheckboxListTile(
                                title: const Text(
                                  'Select All',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                value: _isChecked[0],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked[0] = value ?? false;
                                    for (int i = 0;
                                    i < _checkedStates.length;
                                    i++) {
                                      _checkedStates[i] = _isChecked[0];
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '1  Travelling Waves',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[0],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[0] = value ?? false;
                                if (value == true) {
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '2  Superposition & Reflection',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[1],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[1] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '3  Doppler Effect',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[2],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[2] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[3] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '4  Standing Waves',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[3],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[3] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _checkedStates.contains(true)
                      ? () {
                    // Handle button press for starting the test
                  }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.cyan;
                      },
                    ),
                  ),
                  child: const Text("Start Test"),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

void _showModalBottomSheet5(BuildContext context) {
  final List<bool> _isChecked = [false];
  final List<bool> _checkedStates = List<bool>.generate(
    5,
        (_) => false,
  );

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 25.0,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text("Geometrical & Wave Optics"),
                                subtitle: Text("3 concepts * 687 question"),
                              ),
                              CheckboxListTile(
                                title: const Text(
                                  'Select All',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                value: _isChecked[0],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked[0] = value ?? false;
                                    for (int i = 0;
                                    i < _checkedStates.length;
                                    i++) {
                                      _checkedStates[i] = _isChecked[0];
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '1  Prism',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[0],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[0] = value ?? false;
                                if (value == true) {
                                  _checkedStates[1] = false;
                                  _checkedStates[4] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '2  Optical instruments',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[1],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[1] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '3  Lenses',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[2],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[2] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[3] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '4  Wave Optics',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[3],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[3] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '5  Reflection & Refraction',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[4],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[4] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _checkedStates.contains(true)
                      ? () {
                    // Handle button press for starting the test
                  }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.cyan;
                      },
                    ),
                  ),
                  child: const Text("Start Test"),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

void _showModalBottomSheet6(BuildContext context) {
  final List<bool> _isChecked = [false];
  final List<bool> _checkedStates = List<bool>.generate(
    5,
        (_) => false,
  );

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 25.0,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text("Electricity & Magnetism"),
                                subtitle: Text("3 concepts * 687 question"),
                              ),
                              CheckboxListTile(
                                title: const Text(
                                  'Select All',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                value: _isChecked[0],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked[0] = value ?? false;
                                    for (int i = 0;
                                    i < _checkedStates.length;
                                    i++) {
                                      _checkedStates[i] = _isChecked[0];
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '1  Electromagnetic Induction',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[0],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[0] = value ?? false;
                                if (value == true) {
                                  _checkedStates[1] = false;
                                  _checkedStates[4] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              "2  Coulomb's Law & Electric Field",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[1],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[1] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '3  Capacitor and Capacitance',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[2],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[2] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[3] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              "4  Electric Flux and Gauss's Law",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[3],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[3] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '5  Electric Potential and Potential Energy',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[4],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[4] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _checkedStates.contains(true)
                      ? () {
                    // Handle button press for starting the test
                  }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.cyan;
                      },
                    ),
                  ),
                  child: const Text("Start Test"),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

void _showModalBottomSheet7(BuildContext context) {
  final List<bool> _isChecked = [false];
  final List<bool> _checkedStates = List<bool>.generate(
    3,
        (_) => false,
  );

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 25.0,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text("Thermal Physics"),
                                subtitle: Text("3 concepts * 687 question"),
                              ),
                              CheckboxListTile(
                                title: const Text(
                                  'Select All',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                value: _isChecked[0],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked[0] = value ?? false;
                                    for (int i = 0;
                                    i < _checkedStates.length;
                                    i++) {
                                      _checkedStates[i] = _isChecked[0];
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '1  Thermal Properties of Matter',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[0],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[0] = value ?? false;
                                if (value == true) {
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '2  Thermodynamics',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[1],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[1] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[2] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '3  Kinetics Theory of Gases',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[2],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[2] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _checkedStates.contains(true)
                      ? () {
                    // Handle button press for starting the test
                  }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.cyan;
                      },
                    ),
                  ),
                  child: const Text("Start Test"),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

void _showModalBottomSheet8(BuildContext context) {
  final List<bool> _isChecked = [false];
  final List<bool> _checkedStates = List<bool>.generate(
    5,
        (_) => false,
  );

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 25.0,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text("Modern Physics"),
                                subtitle: Text("3 concepts * 687 question"),
                              ),
                              CheckboxListTile(
                                title: const Text(
                                  'Select All',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                value: _isChecked[0],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked[0] = value ?? false;
                                    for (int i = 0;
                                    i < _checkedStates.length;
                                    i++) {
                                      _checkedStates[i] = _isChecked[0];
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '1  Atomic Physics',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[0],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[0] = value ?? false;
                                if (value == true) {
                                  _checkedStates[1] = false;
                                  _checkedStates[4] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '2  Communication Systems',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[1],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[1] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[3] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '3  Nuclei',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[2],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[2] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[3] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '4  Photoelectric',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[3],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[3] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CheckboxListTile(
                            title: const Text(
                              '5  Semiconductors & Devices',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("     201 question"),
                            value: _checkedStates[4],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedStates[4] = value ?? false;
                                if (value == true) {
                                  _checkedStates[0] = false;
                                  _checkedStates[1] = false;
                                  _checkedStates[2] = false;
                                  _checkedStates[4] = false;
                                  _isChecked[0] = false;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(192, 192, 192, 1.0),
                          height: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _checkedStates.contains(true)
                      ? () {
                    // Handle button press for starting the test
                  }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.cyan;
                      },
                    ),
                  ),
                  child: const Text("Start Test"),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
