import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/Provider.dart';
import 'package:media_booster/Screeen1.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoDeatil extends StatefulWidget {
  int i = 0;
  VideoDeatil(this.i);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VideoDeatilsstate(i: i);
  }
}

class VideoDeatilsstate extends State<VideoDeatil> {
  VideoDeatilsstate({required this.i});
  int i = 0;
  CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
      builder: (context, videopro a, child) {
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
              carouselController: _controller,
              disableGesture: false,
              items: [
                for (int i = 0; i < videolist.length; i++) ...[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assates/Images2.jpg'),
                          fit: BoxFit.fill,
                          opacity: 0.7,
                          colorFilter: ColorFilter.mode(
                              Colors.white60, BlendMode.modulate),
                          repeat: ImageRepeat.noRepeat),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          list[i].value.isInitialized
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 80),
                                  child: AspectRatio(
                                    aspectRatio: list[i].value.aspectRatio,
                                    child: VideoPlayer(
                                      list[i],
                                    ),
                                  ),
                                )
                              : Container(),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              videolist[i].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 10, right: 10),
                            child: SizedBox(
                              child: VideoProgressIndicator(
                                list[i],
                                allowScrubbing: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _controller.previousPage();
                                  },
                                  child: Icon(
                                    Icons.skip_previous_rounded,
                                    size: 45,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    list[i].seekTo(Duration(seconds: -10));
                                  },
                                  child: Icon(
                                    Icons.fast_rewind,
                                    size: 45,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    list[i].value.isPlaying
                                        ? list[i].pause()
                                        : list[i].play();
                                    a.changvalue();
                                  },
                                  child: Icon(
                                    a.isplying ? Icons.pause : Icons.play_arrow,
                                    size: 45,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    list[i].seekTo(Duration(seconds: 10));
                                  },
                                  child: Icon(
                                    Icons.fast_forward,
                                    size: 45,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _controller.nextPage();
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
                viewportFraction: 0.90,
                height: double.infinity,
                onPageChanged: (index, reason) async {
                  index == 0
                      ? list[index = 4].pause()
                      : list[index - 1].pause();
                  a.changingindex(index);
                  a.isplying = false;
                  await list[index].pause();
                },
              )),
        );
      },
    );
  }
}
