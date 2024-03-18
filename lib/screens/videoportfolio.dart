import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class VideoPortfolioScreen extends StatefulWidget {
  const VideoPortfolioScreen({super.key});

  @override
  State<VideoPortfolioScreen> createState() => _VideoPortfolioScreenState();
}

class _VideoPortfolioScreenState extends State<VideoPortfolioScreen> {
  late VideoPlayerController videoPlayerController;

  late Future<void> initializePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //init vidplayercontroller
    // videoPlayerController =
    //     VideoPlayerController.asset('assets/videos/myvideo.mp4');
    final url = Uri.parse(
        'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_5mb.mp4');
    videoPlayerController = VideoPlayerController.networkUrl(url);
    initializePlayer = videoPlayerController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Video'),
      ),
      body: Center(
        child: FutureBuilder(
          future: initializePlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(videoPlayerController),
                ),
                VideoProgressIndicator(
                  videoPlayerController,
                  allowScrubbing: true,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (videoPlayerController.value.isPlaying) {
            videoPlayerController.pause();
          } else {
            videoPlayerController.play();
          }
          setState(() {});
        },
        child: FaIcon(
          videoPlayerController.value.isPlaying
              ? FontAwesomeIcons.pause
              : FontAwesomeIcons.play,
        ),
      ),
    );
  }
}
