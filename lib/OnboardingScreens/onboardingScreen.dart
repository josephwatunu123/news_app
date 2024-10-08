import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/OnboardingScreens/screen1.dart';
import 'package:news_app/OnboardingScreens/screen2.dart';
import 'package:news_app/OnboardingScreens/screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget{
  const OnboardingScreen({super.key,});

  @override
  State<OnboardingScreen>createState()=> _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>{

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
          body: Stack(
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index){

                },
              children:
                 [
                  Screen1(),
                  Screen2(),
                  Screen3(),
                ],

            ),
              Container(
                alignment: Alignment(0,0.5),
                child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3
                ),
              )
            ],
            
          ),
    ));
  }
}