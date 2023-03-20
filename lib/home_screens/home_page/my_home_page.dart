import 'package:final_greaters/home_screens/home_page/home_title.dart';
import 'package:flutter/material.dart';
import '../../helpers.dart';
import '../dashboard/dashboard.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Stack(
              children: <Widget>[HomeTitle(), Dashboard()],
            ),
            bottomNavigationBar: getBannerAddWidget));
  }
}
