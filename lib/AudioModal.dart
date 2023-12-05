import 'package:assets_audio_player/assets_audio_player.dart';

class AudioModal {
  String artist;
  String Img;
  String name;
  String song;
  AssetsAudioPlayer Controller = AssetsAudioPlayer();
  AudioModal(this.artist, this.Img, this.name, this.song, this.Controller);
}
