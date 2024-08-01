

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Constants/decorations.dart';
import 'package:news_app/homepage.dart';

class Screen3 extends StatefulWidget{
  @override
  _Screen3State createState()=> _Screen3State();
}

class _Screen3State extends State<Screen3>{

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
                SizedBox(height: 45,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text('Get News from all over the City', style: greetingsStyle, textAlign: TextAlign.center,),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('We provide large number of articles for you to keep you informed', style: onboardingScreenMinorText, textAlign: TextAlign.center,),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 450,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/around_world.png'))),
                ),
                Container(
                    child: SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        },
                        child: Text("Dive in!"),
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