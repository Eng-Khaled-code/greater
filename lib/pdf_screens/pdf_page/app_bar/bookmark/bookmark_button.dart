import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'bottom_sheet/show_bottom_sheet.dart';

class BookMarkButton extends StatelessWidget {
  const BookMarkButton({Key? key, this.pdfViewerController}) : super(key: key);
  final PdfViewerController? pdfViewerController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.bookmark),
      onPressed: () => bottomSheet(context),
      tooltip: "العلامات المرجعية",
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShowBottomSheet(pdfViewerController: pdfViewerController);
        });
  }
}
