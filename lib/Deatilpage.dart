import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/AudioModal.dart';
import 'package:media_booster/Provider.dart';
import 'package:media_booster/Screeen1.dart';
import 'package:provider/provider.dart';

class Deatilpage extends StatefulWidget {
  int i = 0;
  AudioModal audioModal = AudioModal('', '', '', '', AssetsAudioPlayer());
  Deatilpage(this.audioModal, this.i);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Deatilpagestate(i: i, audioModal: audioModal);
  }
}

class Deatilpagestate extends State<Deatilpage> {
  CarouselController controller = CarouselController();
  int i;
  AudioModal audioModal = AudioModal('', '', '', '', AssetsAudioPlayer());
  Deatilpagestate({required this.audioModal, required this.i});
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Audiofunction>(context, listen: false).setindex(0);
    initfunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
      builder: (context, Audiofunction audiofunction, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'AUDIO PLAYER',
              style: TextStyle(
                letterSpacing: 2,
              ),
            ),
          ),
          body: CarouselSlider(
              carouselController: controller,
              disableGesture: false,
              items: [
                for (int i = 0; i < audiolist.length; i++) ...[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assates/Images2.jpg'),
                          fit: BoxFit.fill,
                          opacity: 0.98,
                          colorFilter: ColorFilter.mode(
                              Colors.white60, BlendMode.modulate),
                          repeat: ImageRepeat.noRepeat),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Container(
                              height: 400,
                              width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Image.asset(audiolist[i].Img,
                                  repeat: ImageRepeat.noRepeat,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              audiolist[i].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              audiolist[i].artist,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          StreamBuilder<Duration>(
                            stream: audiolist[audiofunction.i]
                                .Controller
                                .currentPosition,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Duration duration = snapshot.data!;
                                return ProgressBar(
                                  barHeight: 8,
                                  baseBarColor: Colors.grey,
                                  bufferedBarColor: Colors.grey,
                                  progressBarColor: Colors.blue,
                                  thumbColor: Colors.blue,
                                  timeLabelTextStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  progress: audiolist[audiofunction.i]
                                      .Controller
                                      .currentPosition
                                      .value,
                                  total: durationlist[audiofunction.i],
                                  onSeek: (value) {
                                    audiolist[audiofunction.i]
                                        .Controller
                                        .seekBy(value);
                                  },
                                );
                              } else {
                                return CircularProgressIndicator(
                                  color: Colors.white,
                                );
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.previousPage();
                                  },
                                  child: Icon(
                                    Icons.skip_previous_rounded,
                                    size: 45,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    audiolist[i]
                                        .Controller
                                        .seekBy(Duration(seconds: -10));
                                  },
                                  child: Icon(
                                    Icons.fast_rewind,
                                    size: 45,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    audiolist[i].Controller.isPlaying.value
                                        ? audiolist[i].Controller.pause()
                                        : audiolist[i].Controller.play();
                                    audiofunction.changvalue();
                                  },
                                  child: Icon(
                                    audiofunction.isplying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    size: 45,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    audiolist[i]
                                        .Controller
                                        .seekBy(Duration(seconds: 10));
                                  },
                                  child: Icon(
                                    Icons.fast_forward,
                                    size: 45,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.nextPage();
                                  },
                                  child: Icon(
                                    Icons.skip_next,
                                    size: 45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              ],
              options: CarouselOptions(
                initialPage: i,
                height: double.infinity,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) async {
                  index == 0
                      ? audiolist[index = 4].Controller.stop()
                      : audiolist[index - 1].Controller.stop();
                  audiofunction.changingindex(index);
                  audiofunction.isplying = false;
                  await audiolist[audiofunction.i].Controller.stopped;
                },
              )),
        );
      },
    );
  }

  Future<void> initfunction() async {
    for (int i = 0; i < audiolist.length; i++) {
      await audiolist[i]
          .Controller
          .open(Audio(audiolist[i].song), autoStart: false);
      audiolist[i].Controller.current.listen((event) {
        if (event != null) {
          Duration duration = event.audio.duration;
          durationlist.add(duration);
        }
      });
    }
  }
}
