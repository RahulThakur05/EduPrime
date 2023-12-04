import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectui/phy_videoscreen.dart';
import 'package:projectui/searchtry.dart';
import 'bio_videoscreen.dart';
import 'chem_videoscreen.dart';
import 'main.dart';
import 'math_videoscreen.dart';


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SearchSection(),
          ImportantTopicsCard(),
          MostSearchedLecturesSection(),
        ],
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LectureSearchScreen()));
        },
        child:  TextField(
          enabled: false,
          decoration: InputDecoration(
            hintText: 'Search subjects...',
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02, // Adjust the padding based on screen width
              vertical: screenWidth * 0.01, // Adjust the padding based on screen width
            ),
          ),
        ),
      ),
    );
  }
}

class LectureService {
  final String _baseUrl = '$globalapi';

  Future<List<dynamic>> searchLectures(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/VideoLecture/?search=$query'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load lectures');
    }
  }
}

class MySearchDelegate extends SearchDelegate<List<String>> {
  final LectureService _lectureService = LectureService();
  List<String> _searchHistory = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, []);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      _updateSearchHistory(query);
      return FutureBuilder<List<dynamic>>(
        future: _lectureService.searchLectures(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final results = snapshot.data!;
            final matchingLectureTitles = results
                .where((lecture) =>
                lecture['title']
                    .toLowerCase()
                    .contains(query.toLowerCase()))
                .map<String>((lecture) => lecture['title'])
                .toList();
            return _buildResultsList(matchingLectureTitles);
          } else {
            return Center(child: Text('No results found.'));
          }
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchHistoryList();
  }

  Widget _buildResultsList(List<String> matchingLectureTitles) {
    return ListView.builder(
      itemCount: matchingLectureTitles.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchingLectureTitles[index]),
          onTap: () {
            _updateSearchHistory(matchingLectureTitles[index]);
            // Navigate or perform some action when a result is tapped
          },
        );
      },
    );
  }

  Widget _buildSearchHistoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search History',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _searchHistory.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_searchHistory[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteSearchHistoryItem(index);
                },
              ),
            );
          },
        ),
      ],
    );
  }

  void _updateSearchHistory(String query) {
    if (_searchHistory.contains(query)) {
      _searchHistory.remove(query);
    }
    _searchHistory.insert(0, query);

    // Keep only the most recent 5 search history items
    if (_searchHistory.length > 5) {
      _searchHistory = _searchHistory.sublist(0, 5);
    }
  }

  void _deleteSearchHistoryItem(int index) {
    _searchHistory.removeAt(index);
  }
}


/*class LecturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Search Lectures'),
      onTap: () {
        // Implement action for searching lectures (e.g., show a search dialog).
        _showSearchDialog(context);
      },
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Search Lectures'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter search term...'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Perform the search action here (e.g., fetch lectures based on the search term).
                Navigator.pop(context);
              },
              child: Text('Search'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}*/

class ImportantTopicsCard extends StatefulWidget {
  @override
  _ImportantTopicsCardState createState() => _ImportantTopicsCardState();
}

class _ImportantTopicsCardState extends State<ImportantTopicsCard> {
  bool _showExtraCards = false;

  final Map<String, Color> topicColors = {
    'Electricity Magnetism': const Color.fromRGBO(30, 144, 255, 0.9),
    'Structure of Atom': const Color.fromRGBO(138, 43, 226, 0.9),
    'Conic Section': const Color.fromRGBO(72, 61, 139, 0.5),
    'Anatomy of Flowering Plants': Colors.orange,
    'Ecosystem': Colors.green,
    'Transport in Plants': Colors.pink,
  };


  final List<String> importantTopics = [
    'Electricity Magnetism',
    'Structure of Atom',
    'Conic Section',
    'Anatomy of Flowering Plants',
    'Ecosystem',
    'Transport in Plants ',
  ];
  final List<String> descrip = ["Electricity and Magnetism is a fundamental chapter in physics that explores the fascinating relationship between electric charges and magnetic fields."
      " This chapter delves into the principles of electric circuits, voltage, current, and resistance, helping you understand how electrical devices work."
      " Additionally, it unveils the intriguing world of magnetism, describing how magnets generate fields and interact with charged particles."
      " Together, these concepts form the basis for numerous modern technologies, from household appliances to advanced electronics.",
    "Delve into the heart of matter with this chapter. Explore the atomic structure, electrons, protons, and neutrons. Learn about Bohr's model and quantum mechanical model. Understand electron distribution, orbitals, and quantum numbers. Master these atomic fundamentals to excel in JEE chemistry.",
    "In this chapter, we delve into the fascinating world of conic sections - circles, ellipses, parabolas, and hyperbolas. Explore their geometric properties, equations, and transformations. Learn how these curves appear in real-world scenarios and scientific applications. Understand their significance in JEE mathematics, as they form the basis for topics like coordinate geometry and calculus. Mastering conic sections is essential for problem-solving and scoring well in the JEE examination.",
    "In this chapter, we delve into the internal structure of flowering plants. Explore the intricate details of tissues, such as meristematic, permanent, and vascular tissues. Learn about plant cell types, their functions, and modifications. Understand the transportation of water and nutrients in plants through xylem and phloem. This knowledge is vital for JEE biology, as it forms the foundation for comprehending plant physiology and adaptations. Mastering this topic is essential for a deep understanding of how plants function and thrive",
    "Ecosystems are complex and interconnected communities of living organisms and their physical environments. This chapter explores the intricate web of relationships among plants, animals, microorganisms, and their surroundings."
        " It examines how energy and nutrients flow through ecosystems, supporting life and maintaining ecological balance."
        " Topics include food chains, trophic levels, biodiversity, and the impact of human activities on ecosystems."
        " Understanding ecosystems is vital for environmental science, as it provides insights into the delicate balance of nature and the consequences of disruptions to these intricate systems",
      "Transport in Plants is a fundamental chapter in biology that explores how plants move water, nutrients, and other essential substances within their structures."
          " This chapter delves into the mechanisms of water and nutrient uptake by roots, their movement through the plant's vascular system, and the role of specialized tissues like xylem and phloem."
          " Understanding these processes is crucial for comprehending how plants absorb, distribute, and utilize resources for growth and survival.",


  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Important Topics',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _showExtraCards = !_showExtraCards;
                  });
                },
                child: Text(
                  _showExtraCards ? 'See Less' : 'See More',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
  child:ListView.separated(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: (_showExtraCards ? importantTopics.length : 4) ~/ 2,
  separatorBuilder: (context, index) => SizedBox(height: 10),
  itemBuilder: (context, index) {
  final startIndex = index * 2;
  final endIndex = startIndex + 2;

  return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: importantTopics.sublist(startIndex, endIndex).map((topic) {
    final color = topicColors[topic] ?? Colors.pinkAccent; // Get the color for the topic

    return GestureDetector(
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => TopicDetailsPage(topic: topic as String, description: descrip[importantTopics.indexOf(topic as String)])
  ),
  );
  },
  child: Card(
  child: Container(
  width: 150,
  height: 80,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(7),
  gradient: LinearGradient(
  colors: [
   color,
    color.withOpacity(0.5),
  ],
  ),
  ),
  child: Padding(
  padding: const EdgeInsets.symmetric(
  vertical: 15, horizontal: 25),
  child: Center(
  child: Text(
  topic  ,
  style: const TextStyle(
  fontFamily: "Roboto",
  fontWeight: FontWeight.bold,
  fontSize: 13,
  color: Colors.white),
  ),
  ),
  ),
  ),
  ),
  );
  }).toList(),
  );
  },
  ),
        ),

      ],
    );
  }
}

class ImportantTopicsSection extends StatelessWidget {
  final List<String> importantTopics = [
    'Electricity and Magnetism',
    'Chemical Bonding',
    'Cell Structure',
    'Calculus',
  ];
  final List<String> descrip = ["Electricity and Magnetism is a fundamental chapter in physics that explores the fascinating relationship between electric charges and magnetic fields."
      " This chapter delves into the principles of electric circuits, voltage, current, and resistance, helping you understand how electrical devices work."
      " Additionally, it unveils the intriguing world of magnetism, describing how magnets generate fields and interact with charged particles."
      " Together, these concepts form the basis for numerous modern technologies, from household appliances to advanced electronics.",
    "Delve into the heart of matter with this chapter. Explore the atomic structure, electrons, protons, and neutrons. Learn about Bohr's model and quantum mechanical model. Understand electron distribution, orbitals, and quantum numbers. Master these atomic fundamentals to excel in JEE chemistry.",
    "In this chapter, we delve into the fascinating world of conic sections - circles, ellipses, parabolas, and hyperbolas. Explore their geometric properties, equations, and transformations. Learn how these curves appear in real-world scenarios and scientific applications. Understand their significance in JEE mathematics, as they form the basis for topics like coordinate geometry and calculus. Mastering conic sections is essential for problem-solving and scoring well in the JEE examination.",
    "In this chapter, we delve into the internal structure of flowering plants. Explore the intricate details of tissues, such as meristematic, permanent, and vascular tissues. Learn about plant cell types, their functions, and modifications. Understand the transportation of water and nutrients in plants through xylem and phloem. This knowledge is vital for JEE biology, as it forms the foundation for comprehending plant physiology and adaptations. Mastering this topic is essential for a deep understanding of how plants function and thrive",
    "Ecosystems are complex and interconnected communities of living organisms and their physical environments. This chapter explores the intricate web of relationships among plants, animals, microorganisms, and their surroundings."
        " It examines how energy and nutrients flow through ecosystems, supporting life and maintaining ecological balance."
        " Topics include food chains, trophic levels, biodiversity, and the impact of human activities on ecosystems."
        " Understanding ecosystems is vital for environmental science, as it provides insights into the delicate balance of nature and the consequences of disruptions to these intricate systems",
    "Transport in Plants is a fundamental chapter in biology that explores how plants move water, nutrients, and other essential substances within their structures."
        " This chapter delves into the mechanisms of water and nutrient uptake by roots, their movement through the plant's vascular system, and the role of specialized tissues like xylem and phloem."
        " Understanding these processes is crucial for comprehending how plants absorb, distribute, and utilize resources for growth and survival.",


  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Important Topics',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: importantTopics.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(importantTopics[index]),
              onTap: () {
                // Implement action for navigating to the dedicated page for the selected topic.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TopicDetailsPage(topic: importantTopics[index], description: descrip[index],),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class MostSearchedLecturesSection extends StatelessWidget {
  final List<String> mostSearchedLectures = [
    'Laws of Motion',
    'Chemical Bonding and Molecular Structure',
    'Trignometric Function',
    'Plant Kingdom, Animal Kingdom',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Most Searched Lectures',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mostSearchedLectures.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(mostSearchedLectures[index]),
              onTap: () {
                _openVideoLecture(context, mostSearchedLectures[index]);

                if (mostSearchedLectures[index] == 'Laws of Motion') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PhyVideoScreen(
                            videoKey: 'n_Jr7FinfuU',
                            selectedVideoIndex: 3,
                          ),
                    ),
                  );
                } else if (mostSearchedLectures[index] == 'Chemical Bonding and Molecular Structure') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChemVideoScreen(
                            videoKey: 'UWfw4KHSntzs',
                            selectedVideoIndex: 3,
                          ),
                    ),
                  );
                } else
                if (mostSearchedLectures[index] == 'Trignometric Function') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MathsVideoScreen(
                            videoKey: 'k3J80Wjn6bo',
                            selectedVideoIndex: 2,
                          ),
                    ),
                  );
                } else if (mostSearchedLectures[index] == 'Plant Kingdom, Animal Kingdom') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BioVideoScreen(
                            videoKey: 'M3fkEv7fwcY',
                            selectedVideoIndex: 1,
                          ),
                    ),
                  );
                } else if (mostSearchedLectures[index] == 'Ecosystem') {
                  // Add navigation logic for this topic
                  // Example: Navigator.push(...)
                } else
                if (mostSearchedLectures[index] == 'Transport in Plants') {
                  // Add navigation logic for this topic
                  // Example: Navigator.push(...)
                }
              }

            );
          },
        ),
      ],
    );
  }

  void _openVideoLecture(BuildContext context, String lectureTitle) {
    // Implement action for opening the video lecture page with the selected lecture title.
    // You can use a dedicated video player widget or navigate to a web page with the video.
    // For simplicity, we'll just show a snackbar with the lecture title here.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening video lecture: $lectureTitle'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class TopicDetailsPage extends StatelessWidget {
  final String topic;
  final String description;
 List<String> vid=[];

  TopicDetailsPage({required this.topic, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topic Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topic,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Topic Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
             Text(description),
            const SizedBox(height: 16.0),
            const Text(
              'Relevant Video Lecture:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            // You can add a video player or link to a video here.
            GestureDetector(
              onTap: (){
                if (topic == 'Electricity Magnetism') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhyVideoScreen(
                        videoKey: 'tHEGX4GlurE',
                        selectedVideoIndex: 6,
                      ),
                    ),
                  );
                } else if (topic == 'Structure of Atom') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChemVideoScreen(
                        videoKey: 'qx5iy82Im-k',
                        selectedVideoIndex: 1,
                      ),
                    ),
                  );
                } else if (topic == 'Conic Section') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MathsVideoScreen(
                        videoKey: 'JCR0KkBXrDs',
                        selectedVideoIndex: 3,
                      ),
                    ),
                  );
                } else if (topic == 'Anatomy of Flowering Plants') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BioVideoScreen(
                        videoKey: 'ah9k26q90Tw',
                        selectedVideoIndex: 3,
                      ),
                    ),
                  );
                } else if (topic == 'Ecosystem') {
                  // Add navigation logic for this topic
                } else if (topic == 'Transport in Plants') {
                  // Add navigation logic for this topic
                }
              },
              child:  Text(
                'Video Lecture on $topic' ,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Subject {
  final String name;
  final IconData icon;

  Subject({required this.name, required this.icon});
}
