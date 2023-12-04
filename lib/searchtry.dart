import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectui/search.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class LectureService {
  final String _baseUrl = '$globalapi';

  Future<List<dynamic>> searchLectures(String query) async {
    final response =
    await http.get(Uri.parse('$_baseUrl/searchVideoLecture/?search=$query'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load lectures');
    }
  }
}

class LectureSearchScreen extends StatefulWidget {
  const LectureSearchScreen({Key? key}) : super(key: key);

  @override
  State<LectureSearchScreen> createState() => _LectureSearchScreenState();
}

class _LectureSearchScreenState extends State<LectureSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final LectureService _lectureService = LectureService();
  List<dynamic> _searchResults = [];
  List<String> _searchHistory = [];

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
  }

  Future<void> _loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _searchHistory = prefs.getStringList('searchHistory') ?? [];
    });
  }

  Future<void> _saveSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('searchHistory', _searchHistory);
  }

  void _searchLectures(String query) async {
    if (query.isNotEmpty) { // Check if query is not empty
      try {
        final results = await _lectureService.searchLectures(query);

        setState(() {
          _searchResults = results;
          print(_searchResults);
        });
      } catch (e) {
        // Handle the error if the request fails.
        print('Error: $e');
      }
    }
  }
  void _addToSearchHistory(String query) {
    if (query.isNotEmpty && !_searchHistory.contains(query)) {
      _searchHistory.insert(0, query);
      _saveSearchHistory();
    }
  }
  void _addToSearchHistoryFromVideoTitle(String query) {
    if (query.isNotEmpty && !_searchHistory.contains(query)) {
      _searchHistory.insert(0, query);
      _saveSearchHistory();
    }
  }
  void _clearSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('searchHistory');
    setState(() {
      _searchHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lecture Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                onChanged: (query) {
                  _searchLectures(query);
                },
                onSubmitted: (query) {
                  _searchLectures(query);
                  _addToSearchHistory(query);
                },
                decoration: InputDecoration(
                  hintText: 'Search for lectures...',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      _searchController.clear();
                      _searchLectures('');
                    },
                  )
                      : null,
                ),
              ),
              SizedBox(height: 8),
              if (_searchController.text.isEmpty && _searchHistory.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchHistory.length,
                      itemBuilder: (context, index) {
                        final query = _searchHistory[index];
                        return ListTile(
                          title: Text(query),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                _searchHistory.removeAt(index);
                                _saveSearchHistory();
                              });
                            },
                          ),
                          onTap: () {
                            _searchController.text = query;
                            _searchLectures(query);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          _clearSearchHistory();
                        },
                        child: Text(
                          'Clear History',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final videoDescription =
                        _searchResults[index]['description'] as String? ??
                            'No Description';
                    final videoUrl =
                        _searchResults[index]['video_url'] as String? ?? '';
                    final relatedvideos = [
                      {
                        'title__chpname': 'Chemical Bonding',
                        'description': ' ',
                      },
                      {
                        'title__chpname': 'Trignometric functions',
                        'description': '',
                      },
                      // Add more related video dictionaries here
                    ];
    if (_searchController.text.isNotEmpty) {
      final videoTitle =
          _searchResults[index]['title__Chpname'] as String? ?? 'No Title';
      return ListTile(
        title: Text(videoTitle),
        onTap: () {
          if (videoUrl.isNotEmpty) {
            _addToSearchHistoryFromVideoTitle(videoTitle);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    VideoPlayerScreen(
                      videoUrl: videoUrl,
                      videoTitle: videoTitle,
                      videoDescription: videoDescription,
                      relatedVideos: relatedvideos,
                    ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                Text('No video URL available for this lecture.'),
              ),
            );
          }
        },
      );
    }else {

      return Container();
    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;
  final String videoTitle;
  final String videoDescription;
  final List<dynamic> relatedVideos;

  const VideoPlayerScreen({
    required this.videoUrl,
    required this.videoTitle,
    required this.videoDescription,
    required this.relatedVideos,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? '',
              flags: YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    videoDescription,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left:16.0),
            child: Text(
              'Related Videos:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: relatedVideos.length,
              itemBuilder: (context, index) {
                final relatedVideo = relatedVideos[index];
                final relatedVideoTitle = relatedVideo['title__chpname'] as String? ?? 'No Title';
                final relatedVideoDescription = relatedVideo['description'] as String? ?? 'No Description';

                return ListTile(
                  title: Text(relatedVideoTitle, style: TextStyle(color: Colors.cyan),),
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoPlayerScreen(videoUrl:'lFK68tCpsm0', videoTitle: relatedVideoTitle, videoDescription: videoDescription, relatedVideos: relatedVideos)));
                  },
                );
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
