import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookmarkListItem extends StatelessWidget {
  BookmarkListItem(
      {Key? key,
      this.itemString,
      this.pdfViewerController,
      this.onRemoveBookmark})
      : super(key: key);

  final String? itemString;
  final PdfViewerController? pdfViewerController;
  final Function? onRemoveBookmark;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blueGrey,
        elevation: 25,
        margin: const EdgeInsets.all(3),
        child: ListTile(
          onTap: () => onPress(context),
          title: title(),
          leading: icon(),
          trailing: remove(),
        ));
  }

  onPress(BuildContext context) {
    pdfViewerController!.jumpToPage(int.parse(itemString!));
    Navigator.pop(context);
  }

  Text title() {
    return Text(
      itemString!,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Icon icon() {
    return Icon(
      Icons.bookmark,
      color: Colors.white,
    );
  }

  IconButton remove() {
    return IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
        onPressed: () => onRemoveBookmark!());
  }
}
