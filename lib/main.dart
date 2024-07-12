import 'package:flutter/material.dart';
import 'homepage.dart'; // Import your HomePage file

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter news App';
    return MaterialApp(
      title: appTitle,
      home: HomePage(), // Set HomePage as the home widget
    );
  }
}

class TitleSection extends StatelessWidget{

  const TitleSection({
    super.key,
    required this.name
  });

  final String name;


  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ))
          ],
        )
    );
  }
}

class AuthorSection extends StatelessWidget{
  const AuthorSection({super.key});

  @override
  Widget build (BuildContext context){
    final Color color= Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AuthorSectionContext(name: 'Joseph Kamau', date: '15th July 2020')
        ],
      ),
    );
  }
}

class AuthorSectionContext extends StatelessWidget{
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
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
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
                style: TextStyle(fontSize: 12, color: Colors.grey,)
            )

          ],
        )

      ],

    );
  }
}

class TextSection extends StatelessWidget{
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget{
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build (BuildContext context){
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}
