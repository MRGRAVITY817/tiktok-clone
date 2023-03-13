import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok_clone/constants/gaps.dart';
import 'package:ticktok_clone/constants/sizes.dart';
import 'package:ticktok_clone/features/authentication/login_screen.dart';
import 'package:ticktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Gaps.v80,
            Text(
              "Sign up for TikTok",
              style: TextStyle(
                  fontSize: Sizes.size24, fontWeight: FontWeight.w700),
            ),
            Gaps.v20,
            Text(
              "Create a profile, follow other accounts, make your own videos, and more.",
              style: TextStyle(fontSize: Sizes.size16, color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            Gaps.v40,
            AuthButton(
                text: "Use email & password",
                icon: FaIcon(FontAwesomeIcons.user)),
            Gaps.v16,
            AuthButton(
                text: "Continue with Apple",
                icon: FaIcon(FontAwesomeIcons.apple)),
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Already have an account?',
                style: TextStyle(fontSize: Sizes.size16)),
            Gaps.h5,
            GestureDetector(
                onTap: () => onLoginTap(context),
                child: Text('Log in',
                    style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor)))
          ]),
        ),
      ),
    );
  }
}
