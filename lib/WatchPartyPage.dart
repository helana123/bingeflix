import 'package:flutter/material.dart';
import 'package:binge/VideoPlayerScreen.dart';
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
      home: SelectFriendsPage(),
    );
  }
}

class SelectFriendsPage extends StatefulWidget {
  @override
  _SelectFriendsPageState createState() => _SelectFriendsPageState();
}

class _SelectFriendsPageState extends State<SelectFriendsPage> {
  List<String> selectedFriends = [];

  List<String> friendsList = [
    'Friend 1',
    'Friend 2',
    'Friend 3',
    'Friend 4',
    'Friend 5',
  ];

  void toggleFriendSelection(String friend) {
    setState(() {
      if (selectedFriends.contains(friend)) {
        selectedFriends.remove(friend);
      } else {
        selectedFriends.add(friend);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Invite to Watch '),
      ),
      body: ListView.builder(
        itemCount: friendsList.length,
        itemBuilder: (context, index) {
          final friend = friendsList[index];
          final isSelected = selectedFriends.contains(friend);

          return ListTile(
            title: Text(friend,
              style: TextStyle(color: Colors.white),),
            leading: isSelected
                ? Icon(Icons.check_box,
              color: Colors.white,)
                : Icon(Icons.check_box_outline_blank,
              color: Colors.white,),
            onTap: () => toggleFriendSelection(friend),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement functionality to send the invitation to selected friends
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
