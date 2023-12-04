import 'package:flutter/material.dart';
import 'package:projectui/HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'bio_videoscreen.dart';
import 'main.dart';
import 'math_videoscreen.dart';

class MathsVideos extends StatefulWidget {
  const MathsVideos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MathsVideosState();
}

class _MathsVideosState extends State<MathsVideos>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<String> titless = [];
  List<String> descriptions = [];
  List<String> videoUrls = [];

  final titles = [
    'Sets' ,
    'Relations and Functions',
    'Trignometric Function',
    'Conic Sections',
    'Limits & Derivatives',
    'Mathematical Induction',
    'Permutations and Combinations'
  ];

  final subtitles = [
    "By Umesh Sir \nDuration: 1hr",
    "By Umar Sir \nDuration: 2hr",
    "By Amar Sir \nDuration: 3hr",
    "By Aditya Sir \nDuration: 4hr",
    "By Umesh Sir \nDuration: 1hr",
    "By Umar Sir \nDuration: 2hr",
    "By Amar Sir \nDuration: 3hr",
    "By Aditya Sir \nDuration: 4hr",
    "By Umesh Sir \nDuration: 1hr"
  ];

  final images = [
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
    'mathv.jpg',
  ];
  Future<void> fetchData() async {
    final apiUrl = '$globalapi/mathsVideoLecture/';

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
  @override
  void initState() {
    super.initState();
    fetchData();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildPhysicsVideoItem(int index) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-0.5, 0),
          end: Offset.zero,
        ).animate(_animationController),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MathsVideoScreen(videoKey: videoUrls[index],selectedVideoIndex: index),

                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/${images[index]}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles[index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CustomFont',
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          subtitles[index],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFEB80F8),
                  Color(0xFFC53DC7),
                ],
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          title: const Text(
            "Lectures",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(138, 43, 226, 0.2),
              Color.fromRGBO(138, 43, 226, 0.1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text(
                  "Mathematics",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CustomFont',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "This contains all lectures of Physics which will help you in understanding the subject better. Thank you.",
                ),
                const SizedBox(height: 15),
                for (int i = 0; i < titles.length; i++)
                  _buildPhysicsVideoItem(i),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
