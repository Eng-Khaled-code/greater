// ignore_for_file: must_be_immutable

import 'package:final_greaters/pdf_screens/drawer/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'drawer_item_widget.dart';

class CustomDrawer extends StatelessWidget {
  final PdfViewerController? pdfViewerController;

  CustomDrawer({Key? key, this.pdfViewerController});
  DrawerList drawerList = DrawerList();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
          itemCount: drawerList.items.length,
          itemBuilder: (BuildContext context, int position) => DrawerItemWidget(
              pdfViewerController: pdfViewerController, position: position)),
    );
  }
}
