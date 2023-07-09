import 'package:binge/SeasonsEpisodesPage.dart';
import 'package:binge/VideoPlayerScreen.dart';
import 'package:binge/WatchNowPage.dart';
import 'package:flutter/material.dart';
import 'package:binge/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingeflix',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class MovieDetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final String images;
  final String duration;
  final bool isFavorite;
  final String specifications;

  MovieDetailsPage({
    required this.title,
    required this.description,
    required this.images,
    required this.duration,
    required this.isFavorite,
    required this.specifications,
  });

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  bool isFavorite=true;
  bool isAppBarVisible = true;


  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  void toggleAppBarVisibility() {
    setState(() {
      isAppBarVisible = !isAppBarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(''),
      ),
      body: GestureDetector(
        onTap: toggleAppBarVisibility,
    child: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Colors.deepPurple, Colors.black],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    ),
    ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.images,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        widget.duration,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: toggleFavorite,
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorite ? Colors.red : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: Text(
                            widget.specifications,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(videoUrl: 'https://www.youtube.com/watch?v=dqL9zNn2VDM'),
                        ),
                      );
                    },
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Play from Beginning',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeasonsEpisodesPage(),
                        ),
                      );
                    },
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.playlist_play,
                          color: Colors.white,



                        ),
                        SizedBox(width: 16),
                        Text(
                          'Seasons and episodes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Slider(
                    value: 0.5, // Set the initial value of the seek bar
                    onChanged: (double value) {
                      // Handle seek bar value change
                      // Add your logic here
                    },
                    activeColor: Colors.deepPurple, // Set the color of the seek bar
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WatchNowPage()),
                        );
                      },
                      child: Text('Watch Now'),
                    ),
                  ),
                ],
              ),
            ),
          ],


        ),



      ),
      ),

    );
  }
}
