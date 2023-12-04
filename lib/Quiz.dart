import 'package:flutter/material.dart';
import 'package:projectui/PhysicQuiz.dart';

import 'BioQuiz.dart';
import 'ChemistryQuiz.dart';
import 'MathsQuiz.dart';
import 'navbar.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int expandedContainerIndex = 1; // Initially set no container as expanded
  String activePage = 'All';

  void showContent(String pageId) {
    setState(() {
      activePage = pageId;
    });
  }

  final List<Color> conList = [
    Colors.brown.shade400,
    const Color.fromRGBO(0, 164, 180, 0.8),
    Colors.pink.shade200,
    Colors.greenAccent,
    const Color.fromRGBO(21, 71, 52, 0.6),
  ];

  Color cardNewColor = (Colors.white24);

  bool isAll = true;
  bool isPhy = false;
  bool isChem = false;
  bool isMaths = false;
  bool isBio = false;

  @override
  Widget build(BuildContext context) {
    double buttonFontSize = MediaQuery.of(context).size.width * 0.04;
    double buttonTextSpacing = MediaQuery.of(context).size.width * 0.015;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.orange.shade300,
          ),
        ),
        title: Text('Quiz',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (contex)=> Nav_Bar()));
            },
            child: Icon(Icons.arrow_back)
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isAll = !isAll;
                        isPhy = false;
                        isChem = false;
                        isMaths = false;
                        isBio = false;
                      });
                      showContent('All');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide.none,
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                        return isAll ? conList[0] : Colors.white;
                      }),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(8.0)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                              'assets/images/ico.jpg'),
                        ),
                        SizedBox(width: buttonTextSpacing),
                        Text(
                          "All",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  TextButton(
                    onPressed: () {
                      isAll = false;
                      isPhy = !isPhy;
                      isChem = false;
                      isMaths = false;
                      isBio = false;
                      showContent('Physics');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide.none,
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                        return isPhy ? conList[1] : Colors.white;
                      }),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(8.0)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                              'assets/images/img_5.png'),
                        ),
                        SizedBox(width: buttonTextSpacing),
                        Text(
                          "Physics",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  TextButton(
                    onPressed: () {
                      isAll = false;
                      isPhy = false;
                      isChem = !isChem;
                      isMaths = false;
                      isBio = false;
                      showContent('Chemistry');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide.none,
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                        return isChem ? conList[2] : Colors.white;
                      }),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(8.0)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                              'assets/images/img_4.png'),
                        ),
                        SizedBox(width: buttonTextSpacing),
                        Text(
                          "Chemistry",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  TextButton(
                    onPressed: () {
                      isAll = false;
                      isPhy = false;
                      isChem = false;
                      isMaths = !isMaths;
                      isBio = false;
                      showContent('Maths');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide.none,
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                        return isMaths ? conList[3] : Colors.white;
                      }),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(8.0)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                              'assets/images/img_6.png'),
                        ),
                        SizedBox(width: buttonTextSpacing),
                        Text(
                          "Maths",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  TextButton(
                    onPressed: () {
                      showContent('Bio');
                      isAll = false;
                      isPhy = false;
                      isChem = false;
                      isMaths = false;
                      isBio = !isBio;
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide.none,
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                        return isBio ? conList[4] : Colors.white;
                      }),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(8.0)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                              'assets/images/OJZ2IL0.jpg'),
                        ),
                        SizedBox(width: buttonTextSpacing),
                        Text(
                          "Biology",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          SizedBox(height: 20),
          Expanded(
            child: activePage == 'All'
                ? const All()
                : activePage == 'Physics'
                ? const PhysicQuiz()
                : activePage == 'Chemistry'
                ? const ChemistryQuiz()
                : activePage == 'Maths'
                ? const MathsQuiz()
                : activePage == 'Bio'
                ? const BioQuiz()
                : Container(), // Add a fallback widget or handle the case when none of the conditions match
          ),
        ],
      ),
    );
  }
}
