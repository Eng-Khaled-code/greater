import 'package:final_greaters/helpers.dart';
import 'package:final_greaters/pdf_screens/pdf_page/app_bar/play_pause_button.dart';
import 'package:final_greaters/pdf_screens/pdf_page/app_bar/screen_rotate_button.dart';
import 'package:final_greaters/pdf_screens/pdf_page/app_bar/search_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../google_adds/google_adds_services.dart';
import 'bookmark/bookmark_button.dart';

class PDFAppBar extends StatelessWidget implements PreferredSizeWidget {
  PDFAppBar({Key? key, this.pdfViewerController, this.googleAddServices})
      : super(key: key);

  final PdfViewerController? pdfViewerController;
  final GoogleAddServices? googleAddServices;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: appBarTitle(),
      actions: <Widget>[
        PlayPauseButton(googleAddServices: googleAddServices),
        BookMarkButton(pdfViewerController: pdfViewerController),
        isMobile
            ? ScreenRotateButton(googleAddServices: googleAddServices)
            : Container(),
        SearchButton(
            pdfViewerController: pdfViewerController,
            googleAddServices: googleAddServices),
      ],
    );
  }

  Text appBarTitle() {
    return Text("عظماء الاسلام",
        maxLines: 1,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold));
  }
}
