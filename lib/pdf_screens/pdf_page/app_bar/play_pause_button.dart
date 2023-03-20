import 'package:final_greaters/helpers.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import '../../../google_adds/google_adds_services.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({Key? key, this.googleAddServices}) : super(key: key);
  final GoogleAddServices? googleAddServices;
  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  IconData playPauseIcon = Icons.play_circle_outline;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    assetsAudioPlayer.open(Audio("assets/music/music.mp3"),
        loopMode: LoopMode.playlist, autoStart: false);
    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(playPauseIcon),
      onPressed: () {
        setState(() {
          if (playPauseIcon == Icons.play_circle_outline) {
            playPauseIcon = Icons.pause_circle_outline;
            assetsAudioPlayer.play();
            if (isMobile) widget.googleAddServices!.showInterad();
          } else {
            playPauseIcon = Icons.play_circle_outline;
            assetsAudioPlayer.pause();
          }
        });
      },
      tooltip: "مشغل الموسيقي",
    );
  }
}
