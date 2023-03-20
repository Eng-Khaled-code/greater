import 'package:final_greaters/pdf_screens/drawer/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../google_adds/google_adds_services.dart';
import '../../helpers.dart';

// ignore: must_be_immutable
class DrawerItemWidget extends StatelessWidget {
  DrawerItemWidget({Key? key, this.pdfViewerController, this.position})
      : super(key: key);

  final PdfViewerController? pdfViewerController;
  final int? position;
  DrawerList drawerList = DrawerList();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(drawerList.items[position!].title),
          subtitle: Text(
            drawerList.items[position!].pageNumber.toString(),
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onTap: () => onPress(context),
        ),
        Divider()
      ],
    );
  }

  onPress(BuildContext context) {
    pdfViewerController!.jumpToPage(drawerList.items[position!].pageNumber);
    Navigator.pop(context);
    if (isMobile) GoogleAddServices().showInterad();
  }
}
