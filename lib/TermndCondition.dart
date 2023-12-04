import 'package:flutter/material.dart';

import 'Setting.dart';

class TermCondition extends StatefulWidget {
  const TermCondition({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TermCondition();
}

class _TermCondition extends State<TermCondition> {
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Setting()));
          },
        ),
        title: const Text(
          "Terms and Conditions",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white.withOpacity(0.8),
          child: Container(
            decoration: const BoxDecoration(
            /*  gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(11, 72, 107, 50),
                  Color.fromRGBO(245, 98, 23, 50),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),*/
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Please read these terms and conditions carefully before using our app (App). "
                  "By accessing or using our App, you agree to be bound by these Terms. If you do not agree to all of these Terms, do not use our App.",
                ),
                SizedBox(height: 20),
                Text(
                  "1  Use of the App",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Our App provides JEE and NEET exam preparation content, including lectures videos, mock tests, textbooks of NCERT, and previous year's question papers."
                  "You may access and use our App solely for your personal, non-commercial use.",
                ),
                SizedBox(height: 20),
                Text(
                  "2  User Accounts",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "To access certain features of our App, you may need to create an account. You must provide accurate and complete information when creating your account. "
                  "You are solely responsible for maintaining the confidentiality of your account information and for all activities that occur under your account. "
                  "You agree to notify us immediately of any unauthorized use of your account or any other breach of security.",
                ),
                SizedBox(height: 20),
                Text(
                  "3  Intellectual Property",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Our App and its content, including lectures videos, mock tests, textbooks of NCERT, and previous year's question papers, "
                  "are protected by copyright, trademark, and other laws. You may not copy, modify, distribute, or sell any of our App or its content without our prior written consent.",
                ),
                SizedBox(height: 20),
                Text(
                  "4  User Content",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "You may submit content to our App, including comments, feedback, and other materials (User Content). You retain ownership of your User Content. By submitting User Content to our App,"
                  " you grant us a non-exclusive, worldwide, perpetual, irrevocable, royalty-free, sub-licensable right to use, reproduce, modify, publish, translate, create derivative works from, "
                  "distribute, and display your User Content in any media.",
                ),
                SizedBox(height: 20),
                Text(
                  "5  Prohibited Conduct",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "You may not use our App for any illegal or unauthorized purpose. You may not interfere with or disrupt our App or "
                  "its servers or networks. You may not attempt to gain unauthorized access to any part of our App or its content. You may not use our App to harass, threaten, or intimidate others.",
                ),
                SizedBox(height: 20),
                Text(
                  "6  Disclaimer of Warranties",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Our App is provided on an (as is) and (as available) basis. We make no representations or warranties of any kind, express or implied,"
                  " as to the operation of our App or the information, content, materials, or products included in our App. You expressly agree that "
                  "your use of our App is at your sole risk.",
                ),
                SizedBox(height: 20),
                Text(
                  "7  Limitation of Liability",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "We will not be liable for any damages of any kind arising from the use of our App, "
                  "including, but not limited to, direct, indirect, incidental, punitive, and consequential damages.",
                ),
                SizedBox(height: 20),
                Text(
                  "8  Governing Law and Jurisdiction",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "These Terms shall be governed by and construed in accordance with the laws of [insert applicable jurisdiction]. "
                  "Any dispute arising out of or relating to these Terms shall be subject to the exclusive jurisdiction of the courts of [insert applicable jurisdiction].",
                ),
                SizedBox(height: 20),
                Text(
                  "9  Changes to these Terms",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "We may modify these Terms from time to time. We will notify you of any material changes to these Terms by posting the new Terms on our App.",
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
