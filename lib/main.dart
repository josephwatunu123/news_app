import 'package:flutter/material.dart';
import 'package:news_app/Article.dart';
import 'package:news_app/OnboardingScreens/screen1.dart';
import 'homepage.dart'; // Import your HomePage file

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter news App';
    return MaterialApp(
      title: appTitle,
      home: Screen1(), // Set HomePage as the home widget
    );
  }
}
