import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter news App';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: 'images/plane.jpg',),
              TitleSection(name: 'Contact Lost With KQ Boeing 737-500 After Take Off'),
              AuthorSection(),
              TextSection(description: 'The aviation world faced a harrowing moment when contact was lost with a Kenya Airways Boeing 737-500 shortly after takeoff. '
                  'This incident has sparked widespread concern and speculation as search and rescue operations are vigorously underway. The Boeing 737-500, known for its reliability and extensive use in commercial aviation, was on a routine flight when it seemingly vanished from radar, '
                  'leaving aviation authorities and families of the passengers in a state of anxious uncertainty. The flight, which departed from Jomo Kenyatta International Airport in Nairobi, was bound for its destination with no initial signs of trouble. However,'
                  ' just minutes after takeoff, air traffic controllers reported losing communication with the aircraft. The sudden loss of contact has raised numerous questions regarding the possible causes, ranging from technical malfunctions to adverse weather '
                  'conditions or even more severe scenarios such as mechanical failure or pilot error. As soon as the distress signal was recognized, Kenya Airways activated its emergency response plan. Search and rescue teams, comprising both air and ground units, were dispatched to the last known location of the aircraft. The area is being combed meticulously, with efforts hampered by challenging terrain and weather conditions. Authorities have also reached out'
                  ' to neighboring countries for assistance, widening the search radius in hopes of finding any trace of the missing aircraft.'
              ),


            ],
          ),
        ),
      ),
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
