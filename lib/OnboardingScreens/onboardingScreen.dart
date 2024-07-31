import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/OnboardingScreens/screen1.dart';
import 'package:news_app/OnboardingScreens/screen2.dart';
import 'package:news_app/OnboardingScreens/screen3.dart';

class OnboardingScreen extends StatefulWidget{
  const OnboardingScreen({super.key,});

  @override
  State<OnboardingScreen>createState()=> _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>{

  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
          body: PageView(
            children:
               [
                Screen1(),
                Screen2(),
                Screen3(),
              ],

          ),
    ));
  }
}