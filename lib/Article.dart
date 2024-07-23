import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Constants/decorations.dart';

class Article extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child:Column (
              children: [
                SizedBox(height: 25,),
                ImageSection(image: 'images/plane.jpg'),
                SizedBox(height: 10,),
                ArticleTitle(title: 'Contact Lost with KenyanAir Boeing 737-500 Moments After Take Off'),
                AuthorSectionContext(name: 'Jane Doe', date: '12th July 2024'),
                SizedBox(height: 5,),
                TextSection(description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum,'
                    ' you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.')
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class ImageSection extends StatelessWidget{
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build (BuildContext context){
    return Container(
      height: 250,
      width: 380,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/plane.jpg') ,fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(25),),
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
                style: TextStyle(fontSize: 12, color: Colors.grey,)
            )

          ],
        )

      ],

    );
  }
}

class ArticleTitle extends StatelessWidget{
  const ArticleTitle({super.key, required this.title});
  final String title;
  
  
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 150,
      child: Align(
        alignment: Alignment.center,
        child:  Text(title, style: mainTitleStyle,),
      )
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


