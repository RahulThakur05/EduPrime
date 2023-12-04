import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectui/navbar.dart';
import 'dart:convert';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'main.dart';


class Textbook extends StatefulWidget {
  @override
  _TextbookState createState() => _TextbookState();
}

class _TextbookState extends State<Textbook> {
  List<Map<String, dynamic>> pdfData = [];

  Future<void> fetchPDFs() async {
    final response = await http.get(Uri.parse('$globalapi/PDFView/'));//192.168.43.87:8000
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
    final screenSize = MediaQuery.of(context).size;
    final itemWidth = (screenSize.width - 48.0) / 2;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(138, 43, 226, 0.5),
          ),
        ),
        title: Text('NCERT Books',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (contex)=> Nav_Bar()));
          },
            child: Icon(Icons.arrow_back)
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(15.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final pdfItem = pdfData[index * 2];
                  final subject = pdfItem['title'];
                  final classes = pdfItem['cls'];

                  return Container(
                    margin: EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.cyan.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 3.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            subject,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                        GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 16.0,
                            childAspectRatio: itemWidth / (itemWidth + 100),
                          ),
                          itemCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int classIndex) {
                            final pdfPath =
                            pdfData[index * 2 + classIndex]['pdf_file'];
                            final pdfImg =
                            pdfData[index * 2 + classIndex]['pdf_img'];
                            final className =
                            classIndex == 0 ? '11' : '12';

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PDFViewerPage(
                                      pdfPath: pdfPath,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage(pdfImg),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      color: Colors.indigoAccent,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Class $className',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                childCount: pdfData.length ~/ 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PDFViewerPage extends StatelessWidget {
  final String pdfPath;

  PDFViewerPage({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: SfPdfViewer.network(pdfPath),
      ),
    );
  }
}
