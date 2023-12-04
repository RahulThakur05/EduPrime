import 'package:flutter/material.dart';
import 'package:projectui/Backend.dart';
import 'package:projectui/BioVideos.dart';
import 'package:projectui/ChemistryVideos.dart';
import 'package:projectui/HomePage.dart';
import 'package:projectui/MathsVideos.dart';
import 'package:projectui/PhysicsVideos.dart';
import 'package:projectui/lastVideo.dart';
import 'package:projectui/navbar.dart';
import 'package:projectui/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main.dart';

class Course extends StatefulWidget {
  const Course({Key? key}) : super(key: key);

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  SubPhoto subphoto = SubPhoto();
  List<Color> subcolor = [
    Color.fromRGBO(255, 87, 34, 1),
    Color.fromRGBO(187, 41, 187, 0.2),
    Color.fromRGBO(255, 0, 0, 0.5),
    Color.fromRGBO(0, 100, 0, 0.2),
  ];
  List<Widget> video=[PhysicsVideos(),ChemistryVideos(),MathsVideos(),BioVideos()];

  // Dummy completion data (replace with actual data)
  List<int> quizCompleted = [10, 15, 5, 20]; // Completed quizzes for each subject
  List<int> videoWatched = [5, 10, 2, 8]; // Watched videos for each subject
  List<String> titless = [];
  List<String> descriptions = [];
  List<String> videoUrls = [];
  Future<void> fetchLastAccessedVideo() async {
    final userProvider = Provider.of<UserProvider>(context);

    // Access the email from the provider
    String? Demail = userProvider.email;
    final apiUrl = '$globalapi/lastVideo/$Demail/';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        setState(() {
          // Clear existing data
          titless.clear();
          descriptions.clear();
          videoUrls.clear();

          // Iterate over the list of video objects
          for (final video in data) {
            titless.add(video['last_accessed_video_title']);
            descriptions.add(video['last_accessed_video_description']);
            videoUrls.add(video['last_accessed_video_url']);
          }
        });
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  void initState() {
    super.initState();

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the provider here
    fetchLastAccessedVideo();
  }

  @override
  Widget build(BuildContext context) {
    // Media Query
    final mediaQuery = MediaQuery.of(context);

    // Determine card width based on screen width
    double cardWidth = mediaQuery.size.width * 0.8;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
             color: const Color.fromRGBO(30, 144, 255, 0.6),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Nav_Bar()),
              );
            },
          ),
          title: const Text(
            "All Subjects",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: 160,
                  width: cardWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/ongo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                  if (videoUrls.isNotEmpty) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  LastVideoScreen(videoKey: videoUrls[0], selectedVideoIndex: 1)));
                  } else {
                  // Handle the case where videoUrls is empty or invalid
                  // You can show an error message or take appropriate action.
                  }
                  },
                      icon: Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          bottom: 37,
                        ),
                        child: const Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder<dynamic>(
              future: subphoto.postAllSubPhoto(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  List<dynamic> subPic = snapshot.data!;
                  return Column(
                    children: subPic.map((item) {
                      int index = subPic.indexOf(item);
                      int completedQuizzes = quizCompleted[index];
                      int watchedVideos = videoWatched[index];
                      int totalQuizzes = 25; // Replace with actual total quizzes
                      int totalVideos = 50; // Replace with actual total videos
                      double completionPercentage =
                          ((completedQuizzes + watchedVideos) /
                              (totalQuizzes + totalVideos)) *
                              100;

                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16.0, left: 20, right: 20),
                        child: Card(
                          color: subcolor[index],
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> video[index]));
                            },
                            child: Container(
                              height: 150,
                              child: Row(
                                children: [
                                  Container(
                                    width: cardWidth * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(item['Photo']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.3),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['subname'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Total Quiz: $totalQuizzes',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Total Videos: $totalVideos',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            '${completionPercentage.toStringAsFixed(2)}% Completed',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          LinearProgressIndicator(
                                            value: completionPercentage / 100,
                                            backgroundColor:
                                            Colors.blueAccent.withOpacity(0.5),
                                            valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(
                    child: Text('Invalid data format'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
