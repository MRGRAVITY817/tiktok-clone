import 'package:flutter/material.dart';
import 'package:ticktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;

  const FormButton({super.key, required this.disabled});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size5),
              color: disabled
                  ? Colors.grey.shade300
                  : Theme.of(context).primaryColor),
          duration: const Duration(milliseconds: 200),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
                color: disabled ? Colors.grey.shade400 : Colors.white,
                fontWeight: FontWeight.w600),
            child: const Text(
              'Next',
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
