import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/widgets.dart';

class AudioPlayerController with ChangeNotifier {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  bool isPlaying = false;

  initAudioPlayer() {
    audioPlayer.open(
      Audio.network(''),
      autoStart: false,
      showNotification: true,
    );
  }
  // void playAudio() {
  //   audioPlayer.play();
  //   isPlaying = true;
  //   notifyListeners();
  // }
  //
  // void pauseAudio() {
  //   audioPlayer.pause();
  //   isPlaying = false;
  //   notifyListeners();
  // }
  //
  // void stopAudio() {
  //   audioPlayer.stop();
  //   isPlaying = false;
  //   notifyListeners();
  // }

  void playORpauseAudio() {
    isPlaying = !isPlaying;
    notifyListeners();
  }
}
