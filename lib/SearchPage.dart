import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  List<dynamic> searchResults = [];

  Future<void> searchMovies() async {
    try {
      final results = await searchMoviesByTitle(searchQuery);
      setState(() {
        searchResults = results;
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  Future<List<dynamic>> searchMoviesByTitle(String title) async {
    final apiKey = 'k_0cl8o914'; // Replace with your IMDb API key
    final queryParameters = {
      'apikey': apiKey,
      's': title,
    };

    final uri = Uri.https('api.imdb.com', '/search/', queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final searchResults = jsonResponse['Search'] ?? [];
      return searchResults;
    } else {
      throw Exception('Failed to search movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Search Movies'),
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
          TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Enter movie title',
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: IconButton(
                icon: Icon(Icons.search,
                  color: Colors.white,),
                onPressed: searchMovies,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle sort by action for category 'Genre'
                },
                child: Text('Genre'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle sort by action for category 'Language'
                },
                child: Text('Language'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle sort by action for category 'Series'
                },
                child: Text('Series'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle sort by action for category 'Movies'
                },
                child: Text('Movies'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]),
                  onTap: () {
                    // Handle tap on search result
                  },
                );
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final movie = searchResults[index];
                return ListTile(
                  title: Text(movie['Title']),
                  subtitle: Text(movie['Year']),
                  leading: Image.network(
                    movie['Poster'],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),

        ],
      ),
    ),
    );
  }
}
