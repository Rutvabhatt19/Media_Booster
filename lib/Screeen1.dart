import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/AudioModal.dart';
import 'package:media_booster/Deatilpage.dart';
import 'package:media_booster/Provider.dart';
import 'package:media_booster/VideoModal.dart';
import 'package:media_booster/Videodeatil.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Screen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen1state();
  }
}

late VideoPlayerController controller1;
late VideoPlayerController controller2;
late VideoPlayerController controller3;
late VideoPlayerController controller4;
late VideoPlayerController controller5;

List<VideoPlayerController> list = [
  controller1,
  controller2,
  controller3,
  controller4,
  controller5,
];
final scaffoldState = GlobalKey<ScaffoldState>();
List<AudioModal> audiolist = [
  AudioModal(
      'Arijit Singh',
      'Assates/kyachahiyeposter.jpg',
      'Phir Aur Kya Chahiye',
      'Assates/Phir Aur Kya Chahiye.mp3',
      AssetsAudioPlayer()),
  AudioModal('Arijit Singh', 'Assates/tererangposter.jpeg', 'Tere Rang',
      'Assates/Tere Rang.mp3', AssetsAudioPlayer()),
  AudioModal('Arijit Singh', 'Assates/tumkyamileposter.jpg', 'Tum Kya Mile',
      'Assates/Tum Kya Mile.mp3', AssetsAudioPlayer()),
  AudioModal('Shreya Ghoshal', 'Assates/Bairiyaposter.jpg', 'Bairiya',
      'Assates/Bairiya.mp3', AssetsAudioPlayer()),
  AudioModal('Shreya Ghoshal', 'Assates/barsatposter.jpg', 'Barsaat Aa Gayi',
      'Assates/Barsaat Aa Gayi.mp3', AssetsAudioPlayer()),
];
List<Duration> durationlist = [];

class Screen1state extends State<Screen1> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    controller1 = VideoPlayerController.networkUrl(Uri.parse(videolist[0].url))
      ..initialize();
    controller2 = VideoPlayerController.networkUrl(Uri.parse(videolist[1].url))
      ..initialize();
    controller3 = VideoPlayerController.networkUrl(Uri.parse(videolist[2].url))
      ..initialize();
    controller4 = VideoPlayerController.networkUrl(Uri.parse(videolist[3].url))
      ..initialize();
    controller5 = VideoPlayerController.networkUrl(Uri.parse(videolist[4].url))
      ..initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          DefaultTabController(
            length: 2,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Audio',
                ),
                Tab(
                  text: 'Video',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 700,
            child: TabBarView(controller: _tabController, children: [
              Container(
                height: double.infinity,
                child: Column(
                  children: [
                    for (int i = 0; i < audiolist.length; i++) ...[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Deatilpage(audiolist[i], i),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(audiolist[i].Img),
                                      repeat: ImageRepeat.noRepeat,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      audiolist[i].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      audiolist[i].artist,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
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
                ),
              ),
              Container(
                height: double.infinity,
                child: Column(
                  children: [
                    for (int i = 0; i < videolist.length; i++) ...[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VideoDeatil(i),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      videolist[i].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
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
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

List<VideoModal> videolist = [
  VideoModal(
    'Video 1',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  ),
  VideoModal(
    'Video 2',
    'https://ia902205.us.archive.org/23/items/SampleVideo_908/Bear.mp4',
  ),
  VideoModal('Video 3',
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'),
  VideoModal('Video 4',
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4'),
  VideoModal(
    'Video 5',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  ),
];
