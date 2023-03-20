import 'package:flutter/material.dart';

class TakeBookmarkButton extends StatelessWidget {
  const TakeBookmarkButton({Key? key, this.onPress, this.pageNumber})
      : super(key: key);

  final Function? onPress;
  final int? pageNumber;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress!(),
      child: Text(
        "إضافة صفحة رقم ${pageNumber.toString()} كعلامة مرجعية",
        style: const TextStyle(
            fontFamily: "fav", color: Color.fromARGB(255, 71, 17, 17)),
      ),
    );
  }
}
