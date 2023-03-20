import 'package:flutter/material.dart';

import '../../pdf_screens/pdf_page/my_pdf_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem({Key? key, this.icon, this.title}) : super(key: key);
  final String? title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[cardIcon(), SizedBox(height: 14), cardTitle()],
        ),
      ),
    );
  }

  Icon cardIcon() {
    return Icon(
      icon,
      size: 60,
      color: title == "فيسبوك" || title == "تويتر"
          ? Colors.lightBlue
          : title == "واتس آب"
              ? Colors.lightGreen
              : Colors.pinkAccent,
    );
  }

  Text cardTitle() {
    return Text(
      title!,
      style: TextStyle(
        color: Colors.purple,
        fontFamily: "fav",
        fontSize: 20,
      ),
    );
  }

  onPress(BuildContext context) {
    if (title == "تصفح الكتاب") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MyPDFScreen();
      }));
    } else if (title == "قيم التطبيق") {
      launchUrl(Uri.parse(
          "https://play.google.com/store/apps/details?id=com.engoo.final_greaters"));
    } else if (title == "فيسبوك") {
      launchUrl(
          Uri.parse("https://www.facebook.com/profile.php?id=100003873517574"));
    } else if (title == "تويتر") {
      launchUrl(Uri.parse("https://twitter.com/EngKhaledMoham8?s=09"));
    } else if (title == "واتس آب") {
      launchUrl(Uri.parse("tel://01159245717"));
    } else if (title == "إنستغرام") {
      launchUrl(Uri.parse("https://www.instagram.com/eng_khaled_mohammed/"));
    }
  }
}
