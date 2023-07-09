import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingefllix',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SeasonsEpisodesPage(),
    );
  }
}

class SeasonsEpisodesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Seasons and Episodes'),
      ),
    body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Colors.black, Colors.deepPurple],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    ),
    ),
    child: Column(
        children: [
          SizedBox(height: 16),
          _buildSeasonItem('Season 1', ['Episode 1', 'Episode 2', 'Episode 3']),
          SizedBox(height: 16),
          _buildSeasonItem('Season 2', ['Episode 1', 'Episode 2', 'Episode 3']),
          SizedBox(height: 16),
          _buildSeasonItem('Season 3', ['Episode 1', 'Episode 2', 'Episode 3']),
        ],
      ),
    ),
    );
  }

  Widget _buildSeasonItem(String seasonTitle, List<String> episodes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          seasonTitle,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        SizedBox(height: 8),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: episodes.length,
          itemBuilder: (context, index) {
            final episode = episodes[index];
            return ListTile(
              title: Text(
                episode,
                style: TextStyle(fontSize: 16,
                    color: Colors.white),
              ),
              onTap: () {
                // Handle episode selection
              },
            );
          },
        ),
      ],
    );
  }
}
