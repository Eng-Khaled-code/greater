import 'package:final_greaters/pdf_screens/pdf_page/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../google_adds/google_adds_services.dart';
import '../../helpers.dart';
import '../drawer/drawer.dart';

class MyPDFScreen extends StatefulWidget {
  @override
  MyPDFScreenState createState() => MyPDFScreenState();
}

class MyPDFScreenState extends State<MyPDFScreen> {
  PdfViewerController? _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final GoogleAddServices _googleAddServices = GoogleAddServices();

  final GetStorage storage = GetStorage();

  @override
  void initState() {
    super.initState();
    initialMethod();
  }

  initialMethod() {
    _pdfViewerController = PdfViewerController();

    _getCurrentPage();
    if (isMobile) {
      _googleAddServices.createInterad();
      _googleAddServices.showInterad();
    }
  }

  onDesposeMethod() {
    storage.write("currentPage", _pdfViewerController!.pageNumber);
  }

  @override
  void dispose() {
    super.dispose();
    onDesposeMethod();
  }

  _getCurrentPage() async {
    _pdfViewerController!.jumpToPage(storage.read('currentPage') ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: CustomDrawer(pdfViewerController: _pdfViewerController),
        appBar: PDFAppBar(
          googleAddServices: _googleAddServices,
          pdfViewerController: _pdfViewerController,
        ),
        backgroundColor: Colors.white,
        body: SfPdfViewer.asset(
          "assets/files/greaters.pdf",
          controller: _pdfViewerController,
          key: _pdfViewerKey,
          onTextSelectionChanged: (PdfTextSelectionChangedDetails details) =>
              onTextSelection(details),
        ),
      ),
    );
  }

  onTextSelection(PdfTextSelectionChangedDetails details) {
    if (details.selectedText == null && _overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    } else if (details.selectedText != null && _overlayEntry == null) {
      _showContextMenu(context, details);
    }
  }

  OverlayEntry? _overlayEntry;
  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: ElevatedButton(
            child: const Text('نسخ', style: TextStyle(fontSize: 17)),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: details.selectedText));
              _pdfViewerController!.clearSelection();
            }),
      ),
    );
    _overlayState.insert(_overlayEntry!);
  }
}
