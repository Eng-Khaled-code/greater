import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../google_adds/google_adds_services.dart';
import '../../../helpers.dart';

class ScreenRotateButton extends StatelessWidget {
  const ScreenRotateButton({Key? key, this.googleAddServices})
      : super(key: key);
  final GoogleAddServices? googleAddServices;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.screen_lock_rotation),
      onPressed: () {
        if (MediaQuery.of(context).orientation == Orientation.portrait) {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.landscapeLeft]);
        } else {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        }
        if (isMobile) googleAddServices!.showInterad();
      },
      tooltip: "تدوير الشاشة",
    );
  }
}
