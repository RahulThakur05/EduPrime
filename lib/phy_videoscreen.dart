import 'package:flutter/material.dart';
import 'package:projectui/HomePage.dart';
import 'package:projectui/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login.dart';
import 'main.dart';

class PhyVideoScreen extends StatefulWidget {
  const PhyVideoScreen({Key? key, required this.videoKey,required this.selectedVideoIndex}) : super(key: key);
  final String videoKey;
  final int selectedVideoIndex;

  @override
  _PhyVideoScreenState createState() => _PhyVideoScreenState();
}

class _PhyVideoScreenState extends State<PhyVideoScreen> {


  int selectedVideoIndex = 0;

  List<String> titless = [];
  List<String> descriptions = [];
  List<String> videoUrls = [];


  late YoutubePlayerController _controller;
  final String professorName = "Dr. John Smith";

  void updateSelectedVideo(int index) {
    setState(() {
      selectedVideoIndex = index;
    });
  }

  // Initialize a variable to keep track of the start time
  DateTime? startTime;

// Start watching the video
  void startWatchingVideo() {
    startTime = DateTime.now();
    print(startTime);
  }

// Stop watching the video
  void stopWatchingVideo() {
    if (startTime != null) {
      // Calculate the watched time in minutes
      DateTime endTime = DateTime.now();
      int watchedTimeMinutes = endTime.difference(startTime!).inMinutes;
      print(watchedTimeMinutes);

      // Call the function to update totalminwatched
      updateTotalMinutesWatched(watchedTimeMinutes);

      // Reset the start time
      startTime = null;
    }
  }


  Future<void> updateTotalMinutesWatched(int totalMinWatched) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Access the email from the provider
    String? userEmail = userProvider.email;
    print(userEmail);

    final url = '$globalapi/update_totalminwatched/';

    try {
      if (userEmail != null) {
        final email = userEmail;
        print(email);
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'User-Email': email,
            'totalminwatched': totalMinWatched,
          }),
        );

        if (response.statusCode == 200) {
          // Handle success
          print('Total minutes watched updated successfully');
        } else {
          // Handle error
          print('Failed to update total minutes watched');
        }
      } else {
        // Handle the case where the user's email is not available (user is not logged in)
        print('User not authenticated, please log in');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  Future<void> fetchData() async {
    final apiUrl = '$globalapi/VideoLecture/';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          // Clear existing data
          titless.clear();
          descriptions.clear();
          videoUrls.clear();

          // Iterate over the list of video objects
          for (final video in data) {
            titless.add(video['title']);
            descriptions.add(video['description']);
            videoUrls.add(video['video_url']);
          }
        });
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e.toString());
    }
  }
  void onVideoAccessed(YoutubeMetaData metaData) {
    if (selectedVideoIndex >= 0 && selectedVideoIndex < titless.length) {
      DupdateLastPlayedVideo(
        videoUrls[widget.selectedVideoIndex],
        titless[widget.selectedVideoIndex],
        descriptions[widget.selectedVideoIndex],
      );
    }
    startWatchingVideo();
  }
  void onVideoPausedOrStopped(YoutubeMetaData metaData) {
    // Stop watching the video
    stopWatchingVideo();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoKey,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (titless.isNotEmpty &&
        descriptions.isNotEmpty &&
        videoUrls.isNotEmpty &&
        selectedVideoIndex >= 0 &&
        selectedVideoIndex < titless.length) {
      if (titless.isNotEmpty &&
          descriptions.isNotEmpty &&
          videoUrls.isNotEmpty &&
          selectedVideoIndex >= 0 &&
          selectedVideoIndex < titless.length) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Lectures', style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.deepPurple,
            actions: [
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnotherPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.red,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.redAccent,
                  ),
                  onReady: () {
                    onVideoAccessed(_controller.metadata);
                    },
                  onEnded: (metaData) {
                    // Stop watching the video when it ends
                    onVideoPausedOrStopped(metaData);
                  },
                 /* onPause: (metaData) {
                    // Stop watching the video when it is paused
                    onVideoPausedOrStopped(metaData);
                  },*/
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  titless[widget.selectedVideoIndex],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Professor: $professorName',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ReadMoreText(
                    descriptions[widget.selectedVideoIndex]            ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: const Text(
                  'Related Videos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      //   crossAxisSpacing: 10,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (contex)=> PhyVideoScreen(videoKey: videoUrls[index],selectedVideoIndex: index),));
                          },
                          child: Container(
                            width: 250,
                            child: VideoCardColumn(
                              videoTitle: titless[index],
                              videoThumbnail: 'assets/images/img.png',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(), // or Error message widget
          ),
        );
      }
    }
     else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // or Error message widget
        ),
      );
    }
  }






  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class VideoCardColumn extends StatelessWidget {
  final String videoTitle;
  final String videoThumbnail;

  const VideoCardColumn({
    required this.videoTitle,
    required this.videoThumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    videoThumbnail,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        HomePage();
                      },
                      child: Icon(
                        Icons.play_circle_fill,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Colors.deepPurple,
            child: Text(
              videoTitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}


class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Page'),
      ),
      body: const Center(
        child: Text(
          'This is another page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
class ReadMoreText extends StatefulWidget {
  final String text;

  ReadMoreText(this.text);

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _isExpanded
            ? Text(widget.text)
            : Text(
          widget.text.substring(0, widget.text.length ~/ 2),
          overflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              _isExpanded ? 'Read Less' : 'Read More',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
