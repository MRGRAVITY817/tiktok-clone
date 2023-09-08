import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: Sizes.size12,
          child: Container(
            height: Sizes.size32,
            width: Sizes.size32,
            decoration: BoxDecoration(
              color: const Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          left: Sizes.size12,
          child: Container(
            height: Sizes.size32,
            width: Sizes.size32,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Container(
          height: Sizes.size32,
          width: Sizes.size36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: Sizes.size16,
            ),
          ),
        )
      ],
    );
  }
}
