import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPortfolioScreen extends StatefulWidget {
  const VideoPortfolioScreen({super.key});

  @override
  State<VideoPortfolioScreen> createState() => _VideoPortfolioScreenState();
}

class _VideoPortfolioScreenState extends State<VideoPortfolioScreen> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

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
    videoPlayerController.initialize().then((value) {
      chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          allowFullScreen: true,
          allowMuting: true,
          allowPlaybackSpeedChanging: true,
          autoPlay: false,
          looping: false,
          aspectRatio: videoPlayerController.value.aspectRatio);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Video thru Chewie'),
      ),
      body: Center(
        child: videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: Chewie(
                  controller: chewieController,
                ),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
