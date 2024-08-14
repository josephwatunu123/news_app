import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Article.dart';
import 'package:news_app/Constants/decorations.dart';
import 'package:news_app/Constants/newsApi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  late Future<List<News>> newsFuture;
  
  @override
  void initState(){
    super.initState();
    newsFuture = Newsapi().GetNews();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
              child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      WelcomeGreetings(greetings:'Good Morning'),
                      TopStory(image: 'images/plane.jpg'),
                      SizedBox(height: 25,),
                      Topics(),
                      SizedBox(height: 25,),
                      FutureBuilder<List<News>>(
                          future: newsFuture,
                          builder: (context, snapshot){
                            if(snapshot.connectionState== ConnectionState.waiting){
                              return Center(child: CircularProgressIndicator(),);
                            }else if(snapshot.hasError){
                              return Center(child: Text('Error: ${snapshot.error}'),);
                            }else if(!snapshot.hasData || snapshot.data!.isEmpty){
                              return Center(child: Text('No articles available'),);
                            }
                            final News = snapshot.data!;
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 25,),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: News.length,
                                      itemBuilder: (context, index){
                                        final article= News[index];
                                        return Column(
                                          children: [
                                            FeaturedStory(title:article.title, imageUrl: article.imageUrl,),
                                            SizedBox(height: 20,)
                                          ],
                                        );
                                      }

                                  )
                                ],
                              ),
                            );}
                      )


                    ],
                  )

              ),
            )
        ));

  }
}

class TopStory extends StatelessWidget {
  const TopStory({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Article()));
      },
      child: Container(
        height: 350,
        width: 370,
        decoration:
        BoxDecoration( border: Border.all(color: Colors.white38), borderRadius: BorderRadius.circular(15.0),
          boxShadow: [BoxShadow(color: Colors.white70, blurRadius: 2.0, offset: Offset(2.0,2.0)),]
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Hero(
              tag: 'photo',
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image) ,fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            )),

            SizedBox(height: 6.0),
            Padding(padding: EdgeInsets.all(10),
            child: Text('Contact Lost with KenyanAir Boeing 737-500 Moments After Take Off', style: mainTitleStyle),),
            Container(
              padding: EdgeInsets.all(10),
              child:Align(
                alignment: Alignment.bottomRight,
                child: Text("Date"),
              ),
            )
          ],

        )
      ),
    );
  }
}

class Topics extends StatelessWidget {
  const Topics({
    super.key,
  });

  final List<String> growableTopics = const [
    'Business',
    'Entertainment',
    'General',
    'health',
    'Technology',
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 20),
      height: 25,
        child: Align(
          alignment: Alignment.center,
          child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(growableTopics[0],style: bodytextStyle,),SizedBox(width: 10,),Text(growableTopics[1],style: bodytextStyle,),SizedBox(width: 10,),Text(growableTopics[2],style: bodytextStyle,),SizedBox(width: 10,),Text(growableTopics[3],style: bodytextStyle,),SizedBox(width: 10,),
                Text(growableTopics[1],style: bodytextStyle,),SizedBox(width: 10,),
              ],
            )
          ],
        ),
        )
      );

  }
}

class FeaturedStory extends StatelessWidget {
  const FeaturedStory({super.key, required this.title, required this.imageUrl});
  final String? title;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 400,
      padding: EdgeInsets.all(10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(image: imageUrl != null? NetworkImage(imageUrl!): AssetImage('images/powerplant.jpg'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          SizedBox(width: 10,),

          Expanded (child: Container(

            child: Column(
              children: [
                Expanded(child: Text(title!,style: secondaryTitleStyle,)),
                SizedBox(height:4,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.calendar),

                      Text('Date Text', style: minorDetailsStyle,),
                      SizedBox(width: 2,),
                      Icon(CupertinoIcons.time),

                      Text('Read Time',style: minorDetailsStyle,)
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

class WelcomeGreetings extends StatelessWidget{
  const WelcomeGreetings({super.key, required this.greetings});
  final String greetings;

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: 25,top: 20),
      height: 100,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(greetings, style: greetingsStyle,),
      ),
    );
  }
}

