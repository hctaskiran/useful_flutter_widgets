import 'package:flutter/material.dart';
import 'package:useful_flutter_widgets/Bottom_Nav_Bar/bottom_navigation_bar.dart';
import 'package:useful_flutter_widgets/Google_Bottom_Nav_Bar/google_bottom_nav_bar.dart';
import 'package:useful_flutter_widgets/Validate/validate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,      
      theme: ThemeData(),
      home: CustomNavBarLearn(),
    );
  }
}
