import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Constants/decorations.dart';
import 'package:news_app/Constants/newsApi.dart';

class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  late Future<List<News>> newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture = Newsapi().GetNews();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: FutureBuilder<List<News>>(
            future: newsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('No articles available'),
                );
              }
              final News = snapshot.data!;
              return ListView.builder(
                itemCount: News.length,
                itemBuilder: (context, index) {
                  final article = News[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ImageSection(image: 'images/plane.jpg'),
                        SizedBox(height: 10),
                        ArticleTitle(title: article.title),
                        AuthorSectionContext(
                            name: 'Jane Doe', date: '12th July 2024'),
                        SizedBox(height: 5),
                        TextSection(description: article.content),
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 380,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/plane.jpg'), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}

class AuthorSectionContext extends StatelessWidget {
  const AuthorSectionContext({
    super.key,
    required this.name,
    required this.date,
    // required this.image
  });

  final name;
  final date;

  // final image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('images/persona.jpg'),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(date,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ))
          ],
        )
      ],
    );
  }
}

class ArticleTitle extends StatelessWidget {
  const ArticleTitle({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        height: 150,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title!,
            style: mainTitleStyle,
          ),
        ));
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description!,
        softWrap: true,
      ),
    );
  }
}
