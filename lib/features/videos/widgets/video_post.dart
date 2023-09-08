import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok_clone/constants/sizes.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset("assets/videos/baby_video.mp4");

  bool isPlaying = false;
  Duration animationDuration = const Duration(milliseconds: 130);

  @override
  void initState() {
    super.initState();
    initVideoPlayer();
  }

  void initVideoPlayer() async {
    await videoPlayerController.initialize();

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
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  void onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !videoPlayerController.value.isPlaying) {
      videoPlayerController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: videoPlayerController.value.isInitialized
                ? VideoPlayer(videoPlayerController)
                : Container(color: Colors.blue),
          ),
          Positioned.fill(child: GestureDetector(onTap: onTogglePause)),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedOpacity(
                  opacity: isPlaying ? 0 : 1,
                  duration: animationDuration,
                  child: const FaIcon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                    size: Sizes.size52,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onTogglePause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }
}
