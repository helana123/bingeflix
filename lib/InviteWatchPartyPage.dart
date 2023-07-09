import 'package:binge/Sharepage.dart';
import 'package:flutter/material.dart';

class InviteWatchPartyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Invite for Watch Party'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Invite friends to join the Watch Party!',
              style: TextStyle(fontSize: 18,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WatchPartyPage(partyId: 'partyId')),
                );
                // Handle invite button press
                // Add your logic here
              },
              child: Text('Invite'),
            ),
          ],
        ),
      ),
    );
  }
}
