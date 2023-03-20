import 'package:final_greaters/pdf_screens/pdf_page/app_bar/bookmark/bottom_sheet/bookmark_list.dart';
import 'package:final_greaters/pdf_screens/pdf_page/app_bar/bookmark/bottom_sheet/take_book_mark_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: must_be_immutable
class ShowBottomSheet extends StatefulWidget {
  PdfViewerController? pdfViewerController;

  ShowBottomSheet({Key? key, this.pdfViewerController}) : super(key: key);

  @override
  _ShowBottomSheetState createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  final GetStorage storage = GetStorage();

  List myList = [];

  @override
  void initState() {
    super.initState();
    loadBookmarkList();
  }

  @override
  void dispose() {
    super.dispose();
    storage.write("bookmarks", myList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 40,
          child: TakeBookmarkButton(
            onPress: () => onPressTakeBookmark(),
            pageNumber: widget.pdfViewerController!.pageNumber,
          ),
        ),
        BookmarkList(
          pdfViewerController: widget.pdfViewerController,
          myList: myList,
          onRemoveCallback: (String item) => onRemoveCallback(item),
        )
      ],
    );
  }

  onPressTakeBookmark() {
    bool takedBefoure =
        myList.contains(widget.pdfViewerController!.pageNumber.toString());

    if (takedBefoure) {
      Fluttertoast.showToast(msg: "هذة الصفحة تم اخذها علامة مرجعية من قبل");
    } else {
      setState(
          () => myList.add(widget.pdfViewerController!.pageNumber.toString()));

      storage.write("bookmarks", myList);
      Fluttertoast.showToast(
          msg:
              "تم حفظ العلامة المرجعية لصفحة لرقم ${widget.pdfViewerController!.pageNumber.toString()}");
    }
  }

  Future<void> loadBookmarkList() async {
    List? list = storage.read("bookmarks") ?? [];
    if (list.isNotEmpty) myList = list;
    setState(() {});
  }

  onRemoveCallback(String item) {
    setState(() => myList.remove(item));
    storage.write("bookmarks", myList);
    Fluttertoast.showToast(msg: "تم حذف العلامة المرجعية لصفحة لرقم $item");
  }
}
