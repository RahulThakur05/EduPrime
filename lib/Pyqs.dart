import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'HomePage.dart';
import 'Textbook.dart';
import 'main.dart';
import 'navbar.dart';

class QuestionPapersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Question Papers App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuestionPapersPage(),
    );
  }
}

class QuestionPapersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(72, 61, 139, 0.5),
          ),
        ),
        title: Text('Question Papers',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (contex)=> Nav_Bar()));
      },
        ),
      ),
      body: ListView(
        children: [
          ExamCard(
            examName: 'JEE',
            subjects: ['Physics', 'Chemistry', 'Maths'],
            years: ['2022', '2021', '2020'],
          ),
          ExamCard(
            examName: 'NEET',
            subjects: ['Physics', 'Chemistry', 'Biology'],
            years: ['2022', '2021', '2020'],
          ),
        ],
      ),
    );
  }
}

class ExamCard extends StatelessWidget {
  final String examName;
  final List<String> subjects;
  final List<String> years;

  const ExamCard({
    Key? key,
    required this.examName,
    required this.subjects,
    required this.years,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              examName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Subjects: ${subjects.join(", ")}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Years: ${years.join(", ")}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YearQuestionPapersPage(
                      examName: examName,
                      years: years,
                    ),
                  ),
                );
              },
              child: Text(
                'View Question Papers',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary:  const Color.fromRGBO(72, 61, 139, 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YearQuestionPapersPage extends StatelessWidget {
  final String examName;
  final List<String> years;

  const YearQuestionPapersPage({
    Key? key,
    required this.examName,
    required this.years,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Papers - $examName'),
      ),
      body: ListView.builder(
        itemCount: years.length,
        itemBuilder: (context, index) {
          return QuestionPaperCard(
            year: years[index],
            onPressed: () {
              // Add logic to download the question paper
              _downloadQuestionPaper(context, examName, years[index]);
            },
          );
        },
      ),
    );
  }

  void _downloadQuestionPaper(
      BuildContext context, String examName, String year) {
    // Add code here to download the question paper for the specified exam and year
    // You can show a snackbar or a toast message to indicate the download progress or completion
  }
}

class QuestionPaperCard extends StatefulWidget {
  final String year;
  final VoidCallback onPressed;

  const QuestionPaperCard({
    Key? key,
    required this.year,
    required this.onPressed,
  }) : super(key: key);

  @override
  _QuestionPaperCardState createState() => _QuestionPaperCardState();
}

class _QuestionPaperCardState extends State<QuestionPaperCard> {
  bool isDownloading = false;
  List<Map<String, dynamic>> pdfData = [];
  Future<void> fetchPDFs() async {
    final response = await http.get(Uri.parse('$globalapi/PYQView/'));//192.168.43.87:8000
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        pdfData = data.cast<Map<String, dynamic>>();
      });
    } else {
      throw Exception('Failed to load PDFs');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPDFs();
  }

  @override
  Widget build(BuildContext context) {
    if (pdfData.isEmpty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final pdfPath =
    pdfData[1]['pdf_file'];
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () {
          if (!isDownloading) {
            setState(() {
              isDownloading = true;
            });
            widget.onPressed();
          }
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Year: ${widget.year}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              isDownloading
                  ? SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    )
                  : GestureDetector(
                onTap: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFViewerPage(
                      pdfPath: pdfPath,
                    ),
                  ),
                );
                },
                    child: Icon(
                        Icons.read_more,
                        size: 24,
                      ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
