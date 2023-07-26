import 'package:flutter/material.dart';
import 'package:useful_flutter_widgets/Bottom_Nav_Bar/pages/accountpage.dart';
import 'package:useful_flutter_widgets/Bottom_Nav_Bar/pages/homepage.dart';
import 'package:useful_flutter_widgets/Bottom_Nav_Bar/pages/messagepage.dart';
import 'package:useful_flutter_widgets/Bottom_Nav_Bar/pages/settingspage.dart';

class CustomNavBarLearn extends StatefulWidget {
  const CustomNavBarLearn({super.key});

  @override
  State<CustomNavBarLearn> createState() => CustomNavBarLearnState();
}

class CustomNavBarLearnState extends State<CustomNavBarLearn> {

  // buttombar arasında geçiş yapmak için
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // her page için ayrı ayrı 
  final List<Widget> _pages =[
    HomePage(),
    MessagePage(),
    AccountPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ]),
    );
  }
}