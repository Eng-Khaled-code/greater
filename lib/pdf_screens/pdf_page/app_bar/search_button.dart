import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../google_adds/google_adds_services.dart';
import '../../../helpers.dart';

// ignore: must_be_immutable
class SearchButton extends StatelessWidget {
  SearchButton({Key? key, this.pdfViewerController, this.googleAddServices})
      : super(key: key);

  final PdfViewerController? pdfViewerController;
  final GoogleAddServices? googleAddServices;
  TextEditingController txtSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () => showSearchDialog(context),
      tooltip: "بحث",
    );
  }

  void showSearchDialog(BuildContext context) {
    var alertSearch = AlertDialog(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          "بحث برقم الصفحة",
        ),
        content: textFieldSearch(),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (txtSearchController.text != "") {
                pdfViewerController!
                    .jumpToPage(int.tryParse(txtSearchController.text)!);
                Navigator.pop(context);
                if (isMobile) googleAddServices!.showInterad();
              } else {
                Fluttertoast.showToast(msg: "يجب ان تدخل رقم الصفحة");
              }
            },
            child: const Text("بحث"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          )
        ]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
            textDirection: TextDirection.rtl, child: alertSearch);
      },
    );
  }

  textFieldSearch() {
    return TextField(
      keyboardType: TextInputType.number,
      controller: txtSearchController,
      decoration: InputDecoration(
          hintText: "ادخل رقم الصفحة",
          hintStyle: const TextStyle(color: Colors.blue, fontSize: 12),
          counterText: pdfViewerController!.pageCount.toString() + " - 1"),
    );
  }
}
