import 'package:flutter/material.dart';
import 'package:binge/NotificationPage.dart';
import 'package:binge/DownloadsPage.dart';
import 'package:binge/MovieDetailsPage.dart';
import 'package:binge/Accountpage.dart';
import 'package:binge/SearchPage.dart';

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

class HomePage extends StatelessWidget {
  final List<String> movieTitles = [
    'XO Kitty',
    'F.R.I.E.N.D.S Reunion',
    'Emily in Paris',
    'Manifest',
    'Never Have I Ever',
    'Stranger Things'
    // Add more movie titles
  ];
  final List<String> movieTitlesw = [
    'Big Bang Theory',
    'Queen Charlotte',
    'Young Sheldon',
    'Bridgerton',
    'Wednesday',
    'Mismatched'
    // Add more movie titles
  ];
  final List<String> movieTitlesu = [
    'Lost',
    'The Bold Type',
    'Riverdale',
    'You',
    'Walking Dead',
    'Money Heist'
    // Add more movie titles
  ];
  final List<String> Description = [
    'Kitty Song Covey, who believes she is extremely knowledgeable on love, moves halfway across the world to South Korea, aiming to reconnect with her long-distance boyfriend, Dae. ',
    'The  main cast revisit the sets of the original show , meet with guests who appeared on the show as well as celebrity guests, do table reads and re-enactments of Friends episodes, and share behind-the-scenes ',
    'Emily in Paris is an American romantic comedy-drama television series created by Darren Star,the series stars Lily Collins as an aspiring marketing executive,Emily Cooper,an American.',
    'Manifest centers on the passengers and crew of a commercial airliner who suddenly reappear after being presumed dead for five and a half years.',
    'Never Have I Ever is a coming-of-age comedy about the complicated life of a modern-day first-generation Indian American teenage girl.',
    'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.'
    // Add more movie titles
  ];
  final List<String> Descriptionw = [
    'THE Big Bang Theory is a sitcom about a group of Caltech physicists who can unlock the mysteries of the universe but are too socially inept to connect with most people here on Earth.',
    'The series is a prequel spin-off of the Netflix series Bridgerton. The story focuses on the rise of Charlotte of Mecklenburg-Strelitz to prominence and power in the late 18th century.',
    'The series, set in the 1980s and early 1990s, is a spin-off prequel to The Big Bang Theory and follows main character Sheldon Cooper growing up with his family in East Texas.',
    'Bridegerton revolves around an eponymous fictional family and is set in the competitive world of Regency era Londons ton during the social season where marriageable youth of nobility and gentry are launched into society.',
    'Follows Wednesday Addams years as a student, when she attempts to master her emerging psychic ability, thwart a killing spree, and solve the mystery that embroiled her parents.',
    'After a disastrous set-up by their families, two teens strike up a tentative friendship at their summer program — but deeper feelings arent far behind.'
  ];
  final List<String> Descriptionu = [
    'Lost was a fast-paced, suspenseful, and surreal series about a group of people who survive when their commercial passenger jet, Oceanic Airlines Flight 815',
    'The Bold Type is centered around three friends – Jane (Katie Stevens), Kat (Aisha Dee), and Sutton (Meghann Fahy) – who all work for Scarlet, a global womens magazine.',
    'After a teenager was murdered within the town of Riverdale, this group of teenagers try to unravel the evils lurking within this seemingly innocent town.',
    'You follows a dangerously charming, intensely obsessive young man who goes to extreme measures to insert himself into the lives of those he is transfixed by.',
    'Walking Dead features a large ensemble cast as survivors of a zombie apocalypse trying to stay alive under near-constant threat of attacks from zombies chiefly known as "walkers" by the other characters.',
    'Set in Madrid, a mysterious man known as the "Professor" recruits a group of eight people, who choose city names as their aliases, to carry out an ambitious plan that involves entering the Royal Mint of Spain.'
  ];
  final List<String> specifications = [
    'Romance Drama',
    'Drama Comedy',
    'Adventure Drama ',
    'Sci-Fi ',
    'Teenage Comdey Drama',
    'Sci Fi'
    // Add more movie titles
  ];
  final List<String> specificationsw = [
    'Drama Comedy',
    'Adventure History',
    'Drama Comedy',
    'History Drama',
    'Drama',
    'Romance Drama'
    // Add more movie titles
  ];
  final List<String> specificationsu = [
    'Romance Drama',
    'Drama Comedy',
    'Adventure Drama ',
    'Sci-Fi ',
    'Teenage Comdey Drama',
    'Sci Fi'
    // Add more movie titles
  ];

  final List<String> images = [
    'assets/kitty.jpeg',
    'assets/friends.jpg',
    'assets/emily.jpg',
    'assets/manifest.jpg',
    'assets/nhie.jpeg',
    'assets/stranger.jpg'
  ];

  final List<String> imagesw = [
    'assets/bbt.jpg',
    'assets/char.jpg',
    'assets/shelly.jpg',
    'assets/bridge.jpg',
    'assets/wednes.png',
    'assets/mismatched.jpg'
  ];
  final List<String> imagesu = [
    'assets/lost.jpg',
    'assets/bold.jpg',
    'assets/riverdale.jpg',
    'assets/you.jpeg',
    'assets/dead.jpeg',
    'assets/heist.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
        ),


      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ActionMoviesListPage()),
                          );
                        },
                        child: Text('Action'),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(0.0)), // Set the padding around the button

                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ComedyMoviesListPage()),
                          );



                          // Handle button press
                        },
                        child: Text('Comedy'),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(0.0)), // Set the padding around the button
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DramaMoviesListPage()),
                          );
                        },
                        child: Text('Drama'),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(0.0)), // Set the padding around the button
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ThrillerMoviesListPage()),
                          );
                        },
                        child: Text('Thriller'),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(0.0)), // Set the padding around the button
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => scifiMoviesListPage()),
                          );
                          // Handle button press
                        },
                        child: Text('Sci-Fi'),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(0.0)), // Set the padding around the button
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.black,
              child: Text(
                'Trending Now',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  String imageUrl = images[index % images.length];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsPage(
                            images: images[index],
                            description: Description[index],
                            title: movieTitles[index],
                            duration: '3 hrs',
                            isFavorite: true,
                            specifications: specifications[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 16.0),
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                'Continue Watching',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                padding: EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesw.length,
                  itemBuilder: (BuildContext context, int index) {
                    String imageUrl = imagesw[index % imagesw.length];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsPage(
                              images: imagesw[index],
                              description: Descriptionw[index],
                              title: movieTitlesw[index],
                              duration: '3 hrs',
                              isFavorite: true,
                              specifications: specificationsw[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16.0),
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(imagesw[index]),
                            fit: BoxFit.cover,
                          ),

                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Recommended Movies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                padding: EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesu.length,
                  itemBuilder: (BuildContext context, int index) {
                    String imageUrl = imagesu[index % imagesu.length];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsPage(
                              images: imagesu[index],
                              description: Descriptionu[index],
                              title: movieTitlesu[index],
                              duration: '3 hrs',
                              isFavorite: true,
                              specifications: specificationsu[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16.0),
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(imagesu[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

                SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color:Colors.deepPurple ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {

              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.file_download),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DownloadsPage()),
                );

              },
            ),




            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                );
              },
            ),
          ],
        ),
      ),
    );

  }
}


class ActionMoviesListPage extends StatelessWidget {
  final List<String> actionMovies = [
    'Ghosted',
    'Fast',
    'Extraction 2',
    'Adam Driver 65',
    'Vikram',
    'Bloody Daddy',
    'The Flash',
    'Uncharted'

  ];
  final Map<String, String> actionImages = {
    'Ghosted': 'assets/ghosted.jpg',
    'Fast': 'assets/fast.jpeg',
    'Extraction 2': 'assets/extra.jpeg',
    'Adam Driver 65': 'assets/65.jpeg',
    'Vikram': 'assets/vikram.jpeg',
    'Bloody Daddy': 'assets/bd.jpeg',
    'The Flash': 'assets/flash.jpeg',
    'Uncharted': 'assets/unc.jpeg'


    // Add more artist-image pairs as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action movies'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: ListView.separated(
          padding: EdgeInsets.only(top: 20),
          itemCount: actionMovies.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 30),
          itemBuilder: (BuildContext context, int index) {
            final movie = actionMovies[index];
            final imageAsset = actionImages[movie];
            return GestureDetector(
              onTap: () {
                // Handle movie item tap
                // Navigate to movie details page or perform desired action
              },
              child: ListTile(
                leading: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(imageAsset!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  movie,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class ComedyMoviesListPage extends StatelessWidget {
  final List<String> comedyMovies = [
    'Luck',
    'Free Guy',
    'Baywatch',
    'Yes God Yes',
    'Through my window',
    'Operation Fortune',
    'Hating Game',
    'Heyy baby'
  ];

  final Map<String, String> comedyImages = {
    'Luck': 'assets/luck.jpeg',
    'Free Guy': 'assets/free.jpeg',
    'Baywatch': 'assets/bay.jpeg',
    'Yes God Yes': 'assets/ygy.jpeg',
    'Through my window': 'assets/window.jpeg',
    'Operation Fortune': 'assets/opfort.jpeg',
    'Hating Game': 'assets/hg.jpeg',
    'Heyy baby': 'assets/baby.jpeg'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comedy movies'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 20),
          itemCount: comedyMovies.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 30),
          itemBuilder: (BuildContext context, int index) {
            final movie = comedyMovies[index];
            final imageAsset = comedyImages[movie];
            if (imageAsset != null) {
              return GestureDetector(
                onTap: () {
                  // Handle movie item tap
                  // Navigate to movie details page or perform desired action
                },
                child: ListTile(
                  leading: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imageAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    movie,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            } else {
              // Handle the case when imageAsset is null
              return Container();
            }
          },
        ),
      ),
    );
  }
}


class DramaMoviesListPage extends StatelessWidget {
  final List<String> dramaMovies = [
    'My Fault',
    'After',
    'Endless Love', // Add a comma here
    'Fifty Shades Darker',
    'The fault in our stars',
    '12 Strong',
    'Titanic',
    'Heyy baby'
    // Add more drama movies to the list
  ];
  final Map<String, String> dramaImages = {
    'My Fault': 'assets/luck.jpeg',
    'After': 'assets/free.jpeg',
    'Endless Love': 'assets/bay.jpeg',
    'Fifty Shades Darker': 'assets/ygy.jpeg',
    'The fault in our stars': 'assets/window.jpeg',
    '12 Strong': 'assets/opfort.jpeg',
    'Titanic': 'assets/hg.jpeg',
    'Heyy baby': 'assets/baby.jpeg'
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drama movies'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 20),
          itemCount: dramaMovies.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 30),
          itemBuilder: (BuildContext context, int index) {
            final movie = dramaMovies[index];
            final imageAsset = dramaImages[movie];
            if (imageAsset != null) {
              return GestureDetector(
                onTap: () {
                  // Handle movie item tap
                  // Navigate to movie details page or perform desired action
                },
                child: ListTile(
                  leading: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imageAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    movie,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            } else {
              // Handle the case when imageAsset is null
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class ThrillerMoviesListPage extends StatelessWidget {
  final List<String> thrillerMovies = [
    'Smile',
    'Fall',
    'Evil Dead Rise',
    'Plane',
    'Megan',
    'The Conjuring',
    'Malignant',
    'Heyy baby'
    // Add more action movies to the list
  ];

  final Map<String, String> thrillerImages = {
    'Smile': 'assets/luck.jpeg',
    'Fall': 'assets/free.jpeg',
    'Evil Dead Rise': 'assets/bay.jpeg',
    'Plane': 'assets/ygy.jpeg',
    'Megan': 'assets/window.jpeg',
    'The Conjuring': 'assets/opfort.jpeg',
    'Malignant': 'assets/hg.jpeg',
    'Heyy baby': 'assets/baby.jpeg'
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thriller movies'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 20),
          itemCount: thrillerMovies.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 30),
          itemBuilder: (BuildContext context, int index) {
            final movie = thrillerMovies[index];
            final imageAsset = thrillerImages[movie];
            if (imageAsset != null) {
              return GestureDetector(
                onTap: () {
                  // Handle movie item tap
                  // Navigate to movie details page or perform desired action
                },
                child: ListTile(
                  leading: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imageAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    movie,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            } else {
              // Handle the case when imageAsset is null
              return Container();
            }
          },
        ),
      ),
    );
  }
}
class scifiMoviesListPage extends StatelessWidget {
  final List<String> scifiMovies = [
    'The Adam Project',
    'Oxygen',
    'Moonfall',
    'Prey',
    'Dune',
    'The Tomorrow War',
    'Tomorrowland',
    'Heyy baby'
    // Add more action movies to the list
  ];

  final Map<String, String> scifiImages = {
    'The Adam Project': 'assets/luck.jpeg',
    'Oxygen': 'assets/free.jpeg',
    'Moonfall': 'assets/bay.jpeg',
    'Prey': 'assets/ygy.jpeg',
    'Dune': 'assets/window.jpeg',
    'The Tomorrow War': 'assets/opfort.jpeg',
    'Tomorrowland': 'assets/hg.jpeg',
    'Heyy baby': 'assets/baby.jpeg'
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sci-Fi movies'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 20),
          itemCount: scifiMovies.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 30),
          itemBuilder: (BuildContext context, int index) {
            final movie = scifiMovies[index];
            final imageAsset = scifiImages[movie];
            if (imageAsset != null) {
              return GestureDetector(
                onTap: () {
                  // Handle movie item tap
                  // Navigate to movie details page or perform desired action
                },
                child: ListTile(
                  leading: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imageAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    movie,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            } else {
              // Handle the case when imageAsset is null
              return Container();
            }
          },
        ),
      ),
    );
  }
}













