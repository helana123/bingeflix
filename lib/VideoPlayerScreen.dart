import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:binge/Sharepage.dart';
import 'package:binge/WatchPartyPage.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool isPlaying = false;
  bool isOrientationLocked = false;
  bool showSubtitles = false;
  double sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
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
    _controller.dispose();
    super.dispose();
  }

  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        _controller.play();
      } else {
        _controller.pause();
      }
    });
  }

  void skipForward() {
    final Duration newDuration = _controller.value.position + Duration(seconds: 30);
    _controller.seekTo(newDuration);
  }

  void skipBackward() {
    final Duration newDuration = _controller.value.position - Duration(seconds: 10);
    _controller.seekTo(newDuration);
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
    final Duration newDuration = _controller.value.duration! * value;
    _controller.seekTo(newDuration);
    setState(() {
      sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Play from beginning'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return WatchPartyPage(partyId: 'partyId');
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.live_tv),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SelectFriendsPage();
                },
              );
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
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: togglePlay,
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
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
