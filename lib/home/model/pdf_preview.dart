import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfPreviewer extends StatefulWidget {
  const PdfPreviewer({Key key}) : super(key: key);

  @override
  _PdfPreviewerState createState() => _PdfPreviewerState();
}

class _PdfPreviewerState extends State<PdfPreviewer> {
  PDFDocument document;

  @override
  Widget build(BuildContext context) {
    document = ModalRoute.of(context).settings.arguments as PDFDocument;

    return Scaffold(
        body: Center(
      child: PDFViewer(
        document: document,
      ),
    ));
  }
}
