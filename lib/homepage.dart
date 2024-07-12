import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:50.0),
                  child: TopStory(image: 'images/plane.jpg',),
                )


              ],
            ),
          )

        )
      ),
    );
  }
}

class TopStory extends StatelessWidget {
  const TopStory({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 370,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white38),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [BoxShadow(color: Colors.white, blurRadius: 2.0, offset: Offset(2.0,2.0)),]
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Image.asset(image,width: 600, height: 240, fit: BoxFit.cover,)
          ),
          SizedBox(height: 6.0),
          Expanded(child:
          Text("This is the top Story",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ))
        ],

      )
    );
  }
}

class Topics extends StatelessWidget {
  const Topics({
    super.key,
    required this.topic1,
    required this.topic2,
    required this.topic3,
    required this.topic4,
    required this.topic5,
  });

  final String topic1, topic2, topic3, topic4, topic5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(topic1),
          Text(topic2),
          Text(topic3),
          Text(topic4),
          Text(topic5),
        ],
      ),
    );
  }
}

class FeaturedStory extends StatelessWidget {
  const FeaturedStory({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Container(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(title),
          ),
        ),
      ),
    );
  }
}

