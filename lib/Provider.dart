import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:media_booster/Screeen1.dart';

class Audiofunction extends ChangeNotifier {
  int i = 0;
  List<String> _list = [];
  int _value = 0;

  List<String> get list => _list;
  int get value => _value;

  void setindex(int index) {
    _value = index;
    notifyListeners();
  }

  void changingindex(value) {
    i = value;
    notifyListeners();
  }

  bool isplying = false;
  void changvalue() {
    if (isplying == true) {
      isplying = false;
    } else {
      isplying = true;
    }
    notifyListeners();
  }

  Future<void> function() async {
    await audiolist[Audiofunction().i]
        .Controller
        .open(Audio(audiolist[Audiofunction().i].song), autoStart: false);
    audiolist[Audiofunction().i].Controller.current.listen((event) {
      if (event != null) {
        Duration duration = event.audio.duration;
        durationlist.add(duration);
      }
    });
    notifyListeners();
  }
}

class videopro extends ChangeNotifier {
  int i = 0;
  List<String> _list = [];
  int _value = 0;
  void play() {
    list[i].play();
    notifyListeners();
  }

  void pause() {
    list[i].pause();
    notifyListeners();
  }

  void init() {}
  bool isplying = false;
  int get value => _value;

  void changvalue() {
    if (isplying == true) {
      isplying = false;
    } else {
      isplying = true;
    }
    notifyListeners();
  }

  void setindex(int index) {
    _value = index;
    notifyListeners();
  }

  void changingindex(value) {
    i = value;
    notifyListeners();
  }
}
