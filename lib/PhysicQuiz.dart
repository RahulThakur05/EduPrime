import 'package:flutter/material.dart';
import 'package:projectui/Course.dart';
import 'package:projectui/HomePage.dart';
import 'package:projectui/InfoDetails.dart';
import 'package:projectui/MathsVideos.dart';
import 'package:projectui/Quiz.dart';
import 'package:projectui/question.dart';
import 'package:projectui/tryerror.dart';
import 'package:flutter/material.dart';

class PhysicQuiz extends StatefulWidget {
  const PhysicQuiz({Key? key}) : super(key: key);

  @override
  _PhysicQuizState createState() => _PhysicQuizState();
}

class _PhysicQuizState extends State<PhysicQuiz> {
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
              containerHeader: 'Physics',
              containerColor: const Color.fromRGBO(0, 164, 180, 0.8),
              backgroundImage: 'assets/images/phyquiz.jpg',
              listTiles: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Practice a specific topic",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Basics & Laboratory",
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
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Mechanics",
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
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Solid & Fluid Mechanics",
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
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Waves",
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
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Geometrical & Wave Optics",
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
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Electricity & Magnetism",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet6(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Thermal Physics",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet7(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Modern Physics",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet8(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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




class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
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
              containerHeader: 'Physics',
              containerColor: const Color.fromRGBO(0, 164, 180, 0.8),
              backgroundImage: 'assets/images/phyquiz.jpg',
              listTiles: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Practice a specific topic",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Basics & Laboratory",
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
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Mechanics",
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
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Solid & Fluid Mechanics",
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
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Waves",
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
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Geometrical & Wave Optics",
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
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Electricity & Magnetism",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet6(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Thermal Physics",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet7(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
                            horizontal: isLargeScreen ? 30 : 20,
                            vertical: isLargeScreen ? 20 : 10),
                        child: ListTile(
                          title: Row(
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
                                  "Modern Physics",
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet8(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
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
            ),//buildExpandableContainer
            buildExpandableContainer(
              containerIndex: 1,
              containerExpanded: expandedContainerIndex == 1,
              containerHeader: 'Chemistry',
              containerColor: Colors.blueAccent,
              backgroundImage: 'assets/images/chm.png',
              listTiles: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Practice a specific topic",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "1   Chemical Bonding \n     and Molecular\n     Structure",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "2   Classification of \n     Elements and \n     Periodicity in \n     Properties",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet2(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "3   EnvironMental \n     Chemistry",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet3(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "4   Equilibrium",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // _showModalBottomSheet4(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "5   Hydrocarbons",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet5(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "6   Hydrogen",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "7   Organic Chemistry",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "8   Redox Reactions",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "9   Some basic \n     concepts of \n     chemistry",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "8   States of Matter",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "10   Structure of atom ",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "11   Thermodynamics",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
            buildExpandableContainer(
              containerIndex: 1,
              containerExpanded: expandedContainerIndex == 1,
              containerHeader: 'Maths',
              containerColor: Colors.greenAccent,
              backgroundImage: 'assets/images/bg.jpg',
              listTiles: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Practice a specific topic",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "1   Sets, Relation, and \n     Functions",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "2   Complex number \n     and quadratic \n     Equations",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet2(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "3   Matrices and \n     Determinants",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet3(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "4   Permutations and \n     Combinations",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // _showModalBottomSheet4(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "5   Mathematical \n     Induction",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet5(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "6  Binomial Theorem \n    and its Simple \n    Applications",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "7   Sequence and \n     Series",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "8   Limit, Continuity \n     and Differentiability",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "9   Integral Calculus",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "10   Differential \n       Equations",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
            buildExpandableContainer(
              containerIndex: 4,
              containerExpanded: expandedContainerIndex == 4,
              containerHeader: 'Biology',
              containerColor: Colors.orange,
              backgroundImage: 'assets/images/bg.jpg',
              listTiles: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Practice a specific topic",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "1   Diversity in Living World",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "2   Structural Organization in Plants and Animals",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet2(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "3   Cell Structure and Function",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet3(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "4   Plant Physiology",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // _showModalBottomSheet4(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "5   Human Physiology",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              //_showModalBottomSheet5(context);
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "6   Reproduction",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "7   Genetics and Evolution",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "8   Biology and Human Welfare",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: const Text(
                            "9    Biotechnology and its Applications",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: const Text(
                            "      687 questions",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                          builder: (context) => QuizPage(selectedSubtopics: [1, 2, 3]),
                        ),
                      );
                    }else if (_checkedStates[0]) {
                      // Navigate to page for "Units & Dimensions" chapter
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(selectedSubtopics: 1),
                        ),
                      );
                    }  else if (_checkedStates[1]) {
                      // Navigate to page for "Units & Dimensions" chapter
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(selectedSubtopics: 2),
                        ),
                      );
                    } else if (_checkedStates[2]) {
                      // Navigate to page for "Experimental Physics" chapter
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(selectedSubtopics: 3),
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
