import 'package:flutter/material.dart';
import 'helpers.dart';
import 'home_screens/home_page/my_home_page.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    goToHomePage(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: mySplashScreen(),
        bottomNavigationBar: getBannerAddWidget);
  }

  Center mySplashScreen() {
    return Center(
      child: Column(children: [
        const SizedBox(height: 50),
        splachImage(),
        const SizedBox(height: 10),
        Text(
          "مائة من عظماء الإسلام\n غيروا مجري التاريخ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "للكاتب جهاد الترباني",
        ),
        Text(
          "by eng / khaled mohammed",
        ),
      ]),
    );
  }

  Image splachImage() {
    return Image.asset(
      'assets/images/covera.jpg',
      fit: BoxFit.cover,
      width: 200.0,
      height: 200.0,
    );
  }

  Future<void> goToHomePage(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}
