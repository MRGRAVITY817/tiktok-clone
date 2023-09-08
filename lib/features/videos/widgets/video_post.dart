import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset("assets/videos/baby_video.mp4");

  @override
  void initState() {
    super.initState();
    initVideoPlayer();
  }

  void initVideoPlayer() async {
    await videoPlayerController.initialize();
    videoPlayerController.play();

    setState(() {});

    videoPlayerController.addListener(onVideoChange);
  }

  void onVideoChange() {
    if (videoPlayerController.value.isInitialized) {
      if (videoPlayerController.value.duration == videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: videoPlayerController.value.isInitialized
              ? VideoPlayer(videoPlayerController)
              : Container(color: Colors.blue),
        )
      ],
    );
  }
}
