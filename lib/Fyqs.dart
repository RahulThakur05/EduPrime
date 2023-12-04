import 'package:flutter/material.dart';
import 'package:projectui/profile.dart';

class Fyqs extends StatefulWidget {
  const Fyqs({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Fyqs();
}

class _Fyqs extends State<Fyqs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
        title: const Text(
          "Frequently Question Asked",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: Text(
                "What is the purpose of the app?                                                        ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 20),
              child: Text(
                "The purpose of this app is to provide students preparing for JEE and NEET exams with lectures videos,"
                "mock tests, textbooks of NCERT, and previous year's question papers, all in one place.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: Text(
                "How can I access the lectures videos, mock tests, and textbooks in the app?",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 20),
              child: Text(
                "You can access lectures videos, mock tests, and textbooks in the app by signing"
                "up and logging into your account. Once you have logged in, you will have access to all the features of the app.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: Text(
                "Can I access the previous year's question papers in the app?",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 20),
              child: Text(
                "Yes, you can access previous year's question papers in the app. This will help you to get"
                "an idea of the exam pattern and types of questions that may be asked in the JEE or NEET exam.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: Text(
                "Is the content of the app updated regularly?",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 20),
              child: Text(
                "Yes, the content of the app is updated regularly to keep up with the latest changes and trends in the JEE and NEET exams.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: Text(
                "Can I track my progress and performance through the app?",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 20),
              child: Text(
                "Yes, you can track your progress and performance through the app."
                "The app has a feature that allows you to see your scores in the mock tests and monitor your performance over time.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: Text(
                "Can I download courses and watch them offline later?",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 20),
              child: Text(
                "Yes.It will be available for download.You can watch this later,even when you are offline.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: Text(
                "How can I report an issue or give feedback about the app?",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 20),
              child: Text(
                "You can report an issue or give feedback about the app by contacting the customer support team."
                "You can find their contact details in the app .",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
