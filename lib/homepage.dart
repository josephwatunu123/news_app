import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Constants/decorations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TopStory(image: 'images/plane.jpg'),
                SizedBox(height: 20,),
                Topics(),
                SizedBox(height: 20,),
                FeaturedStory(title: 'An Illinois town fights to save its power plant'),

              ],
            )

            ),
          )

        )
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
  });

  final List<String> growableTopics = const [
    'Topic 1',
    'Topic 2',
    'Topic 3',
    'Topic 4',
    'Topic 5',
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 25,
        color: Colors.blue,
        child: Align(
          alignment: Alignment.center,
          child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(growableTopics[0],),SizedBox(width: 10,),Text(growableTopics[1]),SizedBox(width: 10,),Text(growableTopics[2]),SizedBox(width: 10,),Text(growableTopics[3]),SizedBox(width: 10,),
                Text(growableTopics[1]),SizedBox(width: 10,),Text(growableTopics[1]),SizedBox(width: 10,),Text(growableTopics[3]),
              ],
            )
          ],
        ),
        )
      );

  }
}

class FeaturedStory extends StatelessWidget {
  const FeaturedStory({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 400,
      color: Colors.blueAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/plane.jpg') ,fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          SizedBox(width: 10,),

          Expanded (child: Container(
            color: Colors.teal[200],
            child: Column(
              children: [
                Expanded(child: Text(title)),
                SizedBox(height:4,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.calendar),
                      SizedBox(width: 2,),
                      Text('Date Text'),
                      SizedBox(width: 2,),
                      Icon(CupertinoIcons.time),
                      SizedBox(width: 2,),
                      Text('Read Time')
                    ],
                  ),
                )
              ],
            ),
          )
          )
        ],
      ),
    );
  }
}

