import 'package:flutter/material.dart';
import 'package:ticktok_clone/constants/sizes.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  List<Color> colors = [Colors.blue, Colors.red, Colors.teal, Colors.amber];
  int itemCount = 4;
  final PageController pageController = PageController();

  void onPageChanged(int page) {
    swipeNext(page);
    infinitelyScroll(page);
  }

  void swipeNext(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 130),
      curve: Curves.linear,
    );
  }

  void infinitelyScroll(int page) {
    if (page == itemCount - 1) {
      itemCount = itemCount + 4;
      colors.addAll([Colors.blue, Colors.red, Colors.teal, Colors.amber]);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: Center(
          child: Text(
            "Page $index",
            style: const TextStyle(
              fontSize: Sizes.size72,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onPageChanged: onPageChanged,
      controller: pageController,
    );
  }
}
