import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok_clone/constants/gaps.dart';
import 'package:ticktok_clone/constants/sizes.dart';
import 'package:ticktok_clone/features/authentication/birthday_screen.dart';
import 'package:ticktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;

  @override
  void initState() {
    // `super.initState()` should be at very start....
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    // If we don't dispose controller, there will be a memory leak.
    _passwordController.dispose();

    // `super.dispose()` should be at very end.
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onScaffoldTap() {
    // This will unfocus all the focused inputs.
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const BirthdayScreen()));
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    // State assignment doesn't have to be inside `setState`.
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(title: const Text("Sign up")),
        body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
            ),
            child: Column(
              // Cross axis of column is row direction.
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                const Text(
                  "What is your email?",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v16,
                TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: _onSubmit,
                  obscureText: _obscureText, // This will hide the password text
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onClearTap,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h16,
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                      ],
                    ),
                    hintText: "Make it strong!",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v10,
                const Text(
                  'Your password must have:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Gaps.v10,
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.circleCheck,
                        size: Sizes.size20,
                        color: _isPasswordValid()
                            ? Colors.green
                            : Colors.grey.shade400),
                    Gaps.h5,
                    const Text("8 to 20 characters")
                  ],
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(
                    disabled: !_isPasswordValid(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
