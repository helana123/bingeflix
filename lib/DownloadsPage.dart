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
class DownloadsPage extends StatelessWidget {
  final List<String> downloadedItems = [
    'download1',
    'download2',
    'download3',
    'download4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Downloads'),
      ),
      body:Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Colors.black, Colors.deepPurple],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    ),
    ),
    child: ListView.builder(
        itemCount: downloadedItems.length,
        itemBuilder: (context, index) {
          final item = downloadedItems[index];
          return ListTile(
            title: Text(item,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            subtitle: Text('TV Show'),
            leading: Icon(Icons.download,
              color: Colors.white,),
            trailing: IconButton(
              icon: Icon(Icons.delete,
                  color: Colors.white
              ),
              onPressed: () {
                // Remove the item from the list
                downloadedItems.removeAt(index);
                // Refresh the UI
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$item removed from downloads'),
                  ),
                );
              },
            ),
          );
        },
      ),
      ),
    );
  }
}
