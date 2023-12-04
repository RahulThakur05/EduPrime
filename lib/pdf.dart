import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatefulWidget {
  String doc;
  PDFScreen({required this.doc});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  @override
  Widget build(BuildContext context) {
    PdfViewerController _pdfViewerController = PdfViewerController();
    final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
    @override
    initState() {
      _pdfViewerController = PdfViewerController();
      super.initState();
    }

    return Scaffold(
      body: SfPdfViewer.asset(
        widget.doc,
        // controller: _pdfViewerController, key: _pdfViewerStateKey
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _pdfViewerStateKey.currentState!.openBookmarkView();
              },
              icon: Icon(
                Icons.bookmark,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                _pdfViewerController.jumpToPage(5);
              },
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                _pdfViewerController.zoomLevel = 1.25;
              },
              icon: Icon(
                Icons.zoom_in,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
