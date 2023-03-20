import 'package:final_greaters/home_screens/dashboard/dashoard_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../helpers.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(isMobile ? 0 : -330, 160),
      child: Padding(
        padding: EdgeInsets.only(bottom: 180.0),
        child: GridView.count(
          scrollDirection: isMobile ? Axis.vertical : Axis.horizontal,
          padding: EdgeInsets.all(20),
          childAspectRatio: 1.0,
          crossAxisCount: 2,
          crossAxisSpacing: 28,
          mainAxisSpacing: 28,
          children: [
            DashboardItem(title: "تصفح الكتاب", icon: CupertinoIcons.book),
            DashboardItem(title: "قيم التطبيق", icon: Icons.apps),
            DashboardItem(title: "فيسبوك", icon: Icons.facebook),
            DashboardItem(title: "تويتر", icon: FontAwesomeIcons.twitter),
            DashboardItem(title: "إنستغرام", icon: FontAwesomeIcons.instagram),
            DashboardItem(title: "واتس آب", icon: FontAwesomeIcons.whatsapp),
          ],
        ),
      ),
    );
  }
}
