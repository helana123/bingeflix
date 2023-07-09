import 'package:binge/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      title: 'Who is Watching',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WhoIsWatchingPage(),
    );
  }
}

class WhoIsWatchingPage extends StatelessWidget {
  final List<Profile> profiles = [
    Profile(
      name: 'Oliver',
      image: 'assets/pro1.jpg.jpg',


    ),
    Profile(
      name: 'Katherine',
      image: 'assets/pro2.jpg.jpg',

    ),
    Profile(
      name: 'Chloe',
      image: 'assets/pro3.jpg.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,

              Colors.deepPurple
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              itemCount: profiles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );

                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage(profiles[index].image),
                      ),
                      SizedBox(height: 8),
                      Text(
                        profiles[index].name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    )
    ;
  }
}

class Profile {
  final String name;
  final String image;

  Profile({
    required this.name,
    required this.image,
  });
}