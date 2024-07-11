import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            TopStory(image: 'images/plane.jpg'),
            Topics(
              topic1: 'topic1',
              topic2: 'topic2',
              topic3: 'topic3',
              topic4: 'topic4',
              topic5: 'topic5',
            ),
          ],
        ),
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
      child: Column(
        children: [
          Image.asset(image, width: 600, height: 240, fit: BoxFit.cover),
          Text('Contact Lost With KQ Boeing 737-500 After Take Off'),
        ],
      ),
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

