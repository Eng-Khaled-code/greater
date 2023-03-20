import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../helpers.dart';
import 'book_mark_list_item.dart';

class BookmarkList extends StatelessWidget {
  BookmarkList(
      {Key? key, this.myList, this.pdfViewerController, this.onRemoveCallback})
      : super(key: key);

  final List? myList;
  final PdfViewerController? pdfViewerController;
  final Function? onRemoveCallback;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Flexible(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : 3, childAspectRatio: 6 / 1),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 7, right: 7),
              itemBuilder: (context, position) {
                return BookmarkListItem(
                  pdfViewerController: pdfViewerController,
                  itemString: myList![position].toString(),
                  onRemoveBookmark: () =>
                      onRemoveCallback!(myList![position].toString()),
                );
              },
              itemCount: myList!.length,
            ),
          ),
        ));
  }
}
