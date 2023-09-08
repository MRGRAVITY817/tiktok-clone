import 'package:flutter/material.dart';
import 'package:ticktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int itemCount = 4;
  final PageController pageController = PageController();
  final scrollDuration = const Duration(milliseconds: 200);
  final scrollCurve = Curves.linear;

  void onPageChanged(int page) {
    swipeNext(page);
    infinitelyScroll(page);
  }

  void swipeNext(int page) {
    pageController.animateToPage(
      page,
      duration: scrollDuration,
      curve: scrollCurve,
    );
  }

  void infinitelyScroll(int page) {
    if (page == itemCount - 1) {
      itemCount = itemCount + 4;
      setState(() {});
    }
  }

  void onVideoFinished() {
    pageController.nextPage(duration: scrollDuration, curve: scrollCurve);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => VideoPost(onVideoFinished: onVideoFinished, index: index),
      onPageChanged: onPageChanged,
      controller: pageController,
    );
  }
}
