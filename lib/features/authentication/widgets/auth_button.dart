import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final Function? onTap;

  const AuthButton(
      {super.key, required this.text, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    // `FractionallySizedBox` will expand horizontally til parent's width.
    return GestureDetector(
      onTap: () => onTap!(),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(Sizes.size14),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.grey.shade300, width: Sizes.size1)),
          // `Stack` literally stacks the child elements from device towards user.
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Icon should be placed on the left.
              Align(alignment: Alignment.centerLeft, child: icon),
              Text(
                text,
                style: const TextStyle(
                    fontSize: Sizes.size16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
