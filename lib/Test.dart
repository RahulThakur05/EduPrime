import 'package:flutter/material.dart';

import 'HomePage.dart';

class ExpandableContainerPage extends StatefulWidget {
  const ExpandableContainerPage({Key? key}) : super(key: key);

  @override
  _ExpandableContainerPageState createState() =>
      _ExpandableContainerPageState();
}

class _ExpandableContainerPageState extends State<ExpandableContainerPage> {
  int expandedContainerIndex = 1; // Initially set no container as expanded

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        leading: Icon(Icons.arrow_circle_left_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildExpandableContainer(
              containerIndex: 2,
              containerExpanded: expandedContainerIndex == 2,
              containerHeader: 'Container 2',
              containerColor: Colors.blue,
              backgroundImage: 'assets/images/1.png',
              height: 500,
              listTiles: [
                ListTile(
                  title: Text('List Tile 1'),
                ),
                ListTile(
                  title: Text('List Tile 2'),
                ),
                ListTile(
                  title: Text('List Tile 3'),
                ),
              ],
            ),
            buildExpandableContainer(
              containerIndex: 3,
              containerExpanded: expandedContainerIndex == 3,
              containerHeader: 'Container 3',
              containerColor: Colors.white,
              backgroundImage: 'assets/images/chm.png',
              listTiles: [
                ListTile(
                  title: Text('List Tile 1'),
                ),
                ListTile(
                  title: Text('List Tile 2'),
                ),
                ListTile(
                  title: Text('List Tile 3'),
                ),
              ],
            ),
            buildExpandableContainer(
              containerIndex: 4,
              containerExpanded: expandedContainerIndex == 4,
              containerHeader: 'Container 4',
              containerColor: Colors.orange,
              backgroundImage: 'assets/images/bg.jpg',
              listTiles: [
                ListTile(
                  title: Text('List Tile 1'),
                ),
                ListTile(
                  title: Text('List Tile 2'),
                ),
                ListTile(
                  title: Text('List Tile 3'),
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
          return Container(
            color: Colors.white,
            child: Center(
              child: Column(
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
                          title: Text("Basics & Laboratory"),
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
                              for (int i = 0; i < _checkedStates.length; i++) {
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
                        '1  Units & Dimensions',
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
                        '2  Experimental Physics',
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
                        '3  Mathematical Tools',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press for starting the test
                        if (_isChecked[0]) {
                          // Navigate to page for "Select All" chapter
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        } else if (_checkedStates[1]) {
                          // Navigate to page for "Units & Dimensions" chapter
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        } else if (_checkedStates[2]) {
                          // Navigate to page for "Experimental Physics" chapter
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
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
              ),
            ),
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
                                title: Text("Mechanics"),
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
                              '1  Kinematics',
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
                              '2  Circular Motion',
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
                              '3  Laws of Motion & Friction',
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
                              '4  Work, Energy, & Power',
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
                              '5  Gravitation',
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
                                title: Text("Solid & Fluid Mechanics"),
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
                              '1  Surface Tension & Energy',
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
                              '2  Viscosity & Terminal Velocity',
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
                              '3  Hydrostatics(Liquids at Rest)',
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
                              '4  Solids',
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
