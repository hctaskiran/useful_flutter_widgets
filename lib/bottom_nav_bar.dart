// Custom bottom navigation bar tutorial with google_nav_bar //


import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarLearn extends StatefulWidget {
  const NavBarLearn({super.key});

  @override
  State<NavBarLearn> createState() => _NavBarLearnState();
}

class _NavBarLearnState extends State<NavBarLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('duck'), backgroundColor: customColors().grey900Color),
      body: Center(child: Text('duck', style: TextStyle(fontSize: 30),)),
      bottomNavigationBar: Container(
        color: customColors().grey900Color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            gap: 10,
            onTabChange: (index) {
              print(index);
            },
            backgroundColor: customColors().grey900Color,
            color: customColors().whiteColor,
            activeColor: customColors().whiteColor,
            tabBackgroundColor: customColors().grey800Color,
            padding: EdgeInsets.all(16),
            tabs: [
              customButtons().homeButton,
              customButtons().favButton,
              customButtons().searchButton,
              customButtons().settingButton
            ]),
        ),
      ),
    );
  }
}


class customButtons {
  final homeButton = GButton(icon: customIcons().homeIcon, text: 'Home');
  final favButton = GButton(icon: customIcons().favIcon, text: 'Favs');
  final searchButton = GButton(icon: customIcons().searchIcon, text: 'Search',);
  final settingButton = GButton(icon: customIcons().settingIcon, text: 'Settings',);
}

class customIcons {
  final homeIcon = Icons.home_rounded;
  final favIcon = Icons.favorite_border_rounded;
  final searchIcon = Icons.search;
  final settingIcon = Icons.settings;
}

class customColors {
  final whiteColor = Colors.white;
  final grey900Color = Colors.grey.shade900;
  final grey800Color = Colors.grey.shade800;
}