import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Bingefllix',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NotificationPage(),
    );
  }
}
class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body:Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Colors.black, Colors.deepPurple],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    ),
    ),
    child: ListView(
        children: [
          _buildNotificationItem(
            title: 'New Message',
            subtitle: 'You have a new message',
          ),
          _buildNotificationItem(
            title: 'New Comment',
            subtitle: 'Someone commented on your post',
          ),
          _buildNotificationItem(
            title: 'Friend Request',
            subtitle: 'You have a new friend request',
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white
            ),
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
