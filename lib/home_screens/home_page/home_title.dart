import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 230,
        decoration: decoration(),
        child: Transform.translate(
          offset: Offset(0, 50),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "مائة من عظماء الإسلام \nغيروا مجري التاريخ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  decorationStyle: TextDecorationStyle.dotted,
                  wordSpacing: 3,
                  letterSpacing: 5.0,
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "fav",
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  BoxDecoration decoration() {
    return BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50.0)));
  }
}
