import 'package:flutter/material.dart';
import 'package:projectui/HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'bio_videoscreen.dart';
import 'main.dart';

class BioVideos extends StatefulWidget {
  const BioVideos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BioVideosState();
}

class _BioVideosState extends State<BioVideos>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<String> titless = [];
  List<String> descriptions = [];
  List<String> videoUrls = [];

  var title = [
    'The Living World,Biological Classification',
    'Plant Kingdom,Animal Kingdom',
    'Morphology of Flowering Plants',
    'Anatomy of Flowering Plants',
    'Structural Organisation in Animals',
    'The Unit of Life,Biomolecules',
    'Cell Cycle and Cell Division',
    'Transport in Plants',
    'Mineral Nutrition,Photosynthesis in Higher Plants',
    'Respiration in Plants,Plant Growth and Development',
    'Breathing and Exchange of Gases',
    'Body Fluids and Circulation',
    'Excretory Products and their Elimination',
    'Locomotion and Movement',
    'Neural Control and Coordination',
    'Chemical Coordination and Integration'
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
    "By Umesh Sir \nDuration: 1hr",
    "By Umesh Sir \nDuration: 1hr",
    "By Umar Sir \nDuration: 2hr",
    "By Amar Sir \nDuration: 3hr",
    "By Aditya Sir \nDuration: 4hr",
    "By Umesh Sir \nDuration: 1hr",
    "By Umar Sir \nDuration: 2hr",
    "By Amar Sir \nDuration: 3hr"
  ];

  final images = [
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
    'biov.jpg',
  ];
  Future<void> fetchData() async {
    final apiUrl = '$globalapi/bioVideoLecture/';

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
                      BioVideoScreen(videoKey: videoUrls[index],selectedVideoIndex: index),
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
                          title[index],
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
                  Color(0xFFFFDB76),
                  Color(0xFFEAA731),
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.orange.shade200,
              Colors.orange.shade100,
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
                Text(
                  "Biology",
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
                for (int i = 0; i < title.length; i++)
                  _buildPhysicsVideoItem(i),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
