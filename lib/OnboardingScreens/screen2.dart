import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Constants/decorations.dart';

class Screen2 extends StatefulWidget{
  @override
  _Screen2State createState()=> _Screen2State();
}

class _Screen2State extends State<Screen2>{

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  child: Text('All the news', style: greetingsStyle,),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Expanded
                      (child: Text('We provide large number of articles for you to keep you informed', style: onboardingScreenMinorText,)),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 500,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/news_anywhere.png'))),
                ),
                Container(
                    child: SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("Next"),
                      ),
                    )
                ),
                SizedBox(height: 15,),
                Text('Skip')
              ],
            ),

          ),
        ),
      ),
    );
  }
}