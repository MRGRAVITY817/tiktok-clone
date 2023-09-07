import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok_clone/constants/sizes.dart';
import 'package:ticktok_clone/features/authentication/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int selectedIndex = 0;

  final screens = [
    const Center(child: Text("Home")),
    const Center(child: Text("Search")),
    const Center(child: Text("Search")),
    const Center(child: Text("Search")),
    const Center(child: Text("Search")),
  ];

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size12),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              NabTab(
                text: "Home",
                isSelected: selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                onTap: () => onTap(0),
              ),
              NabTab(
                text: "Discover",
                isSelected: selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => onTap(1),
              ),
              NabTab(
                text: "Inbox",
                isSelected: selectedIndex == 3,
                icon: FontAwesomeIcons.message,
                onTap: () => onTap(3),
              ),
              NabTab(
                text: "Profile",
                isSelected: selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                onTap: () => onTap(4),
              )
            ]),
          )),
    );
  }
}
