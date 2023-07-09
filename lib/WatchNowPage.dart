import 'package:binge/InviteWatchPartyPage.dart';
import 'package:binge/WatchPartyPage.dart';
import 'package:binge/Sharepage.dart';
import 'package:flutter/material.dart';
import 'package:binge/homepage.dart';
import 'package:flutter/services.dart';


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




class WatchNowPage extends StatefulWidget {
  @override
  _WatchNowPageState createState() => _WatchNowPageState();

}

class _WatchNowPageState extends State<WatchNowPage> {
  bool isPlaying = false;
  double playbackSpeed = 1.0;
  bool isOrientationLocked = false;
  bool showSubtitles = false;
  double sliderValue = 0.5;

  @override
  void initState() {
    super.initState();
    // Set the orientation to landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Reset the orientation when the page is disposed
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void skipForward() {
    // Handle skipping forward logic
  }

  void skipBackward() {
    // Handle skipping backward logic
  }

  void toggleOrientationLock() {
    setState(() {
      isOrientationLocked = !isOrientationLocked;
    });
  }

  void toggleSubtitles() {
    setState(() {
      showSubtitles = !showSubtitles;
    });
  }

  void playNextEpisode() {
    // Handle playing next episode logic
  }

  void onSliderChanged(double value) {
    setState(() {
      sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Watch Now'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () { showDialog(
              context: context,
              builder: (BuildContext context) {
                return WatchPartyPage(partyId: 'partyId'); // Replace DialogPage with your custom dialog content
              },
            );
              // Handle share button press
              // Add your logic here
            },
          ),
          IconButton(
            icon: Icon(Icons.live_tv),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SelectFriendsPage(); // Replace DialogPage with your custom dialog content
                },
              );// Handle watch party button press
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset('',
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Colors.black54,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: skipBackward,
                                  icon: Icon(
                                    Icons.replay_10,
                                    color: Colors.white,
                                    size: 36,
                                  ),
                                ),
                                IconButton(
                                  onPressed: togglePlay,
                                  icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 36,
                                  ),
                                ),
                                IconButton(
                                  onPressed: skipForward,
                                  icon: Icon(
                                    Icons.forward_30,
                                    color: Colors.white,
                                    size: 36,
                                  ),
                                ),
                              ],
                            ),
                            Slider(
                              value: sliderValue,
                              onChanged: onSliderChanged,
                              activeColor: Colors.deepPurple,
                              inactiveColor: Colors.grey,
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // Handle speed button press
                                    // Add your logic here
                                  },
                                  icon: Icon(
                                    Icons.speed,
                                    color: Colors.white,
                                    size: 36,
                                  ),
                                ),
                                IconButton(
                                  onPressed: toggleSubtitles,
                                  icon: Icon(
                                    showSubtitles
                                        ? Icons.closed_caption
                                        : Icons.closed_caption_off,
                                    color: Colors.white,
                                    size: 36,
                                  ),
                                ),
                                IconButton(
                                  onPressed: toggleOrientationLock,
                                  icon: Icon(
                                    isOrientationLocked
                                        ? Icons.screen_lock_rotation
                                        : Icons.screen_rotation,
                                    color: Colors.white,
                                    size: 36,
                                  ),
                                ),
                                IconButton(
                                  onPressed: playNextEpisode,
                                  icon: Icon(
                                    Icons.skip_next,
                                    color: Colors.white,
                                    size: 36,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                          ],
                        ),
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


