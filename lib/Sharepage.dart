import 'package:binge/WatchPartyPage.dart';
import 'package:flutter/material.dart';

class WatchPartyPage extends StatelessWidget {
  final String partyId;

  WatchPartyPage({required this.partyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Share link'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'movie link:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 16),
            Text(
              '(https:...........)',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add functionality to copy the party ID to the clipboard
              },
              child: Text('Copy movie link'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {

                // Add functionality to share the party ID
              },
              child: Text('Share movie link'),
            ),
          ],
        ),
      ),
    );
  }
}
