import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projectui/BioVideos.dart';
import 'package:projectui/Course.dart';
import 'package:projectui/MathsVideos.dart';
import 'package:projectui/Pyqs.dart';
import 'package:projectui/Quiz.dart';
import 'package:projectui/Setting.dart';
import 'package:projectui/Textbook.dart';
import 'package:projectui/testominal.dart';
import 'package:projectui/user_provider.dart';
import 'package:provider/provider.dart';

import 'Backend.dart';
import 'ChemistryVideos.dart';
import 'PhysicsVideos.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserData UserService = UserData();
  HomePhoto homepic = HomePhoto();

  // Variables to store loaded data
  List<dynamic> testimonials = [];
  List<dynamic> homePhotos = [];

  // VideoCard Color
  final List<Color> colorVideoList = [
    const Color.fromRGBO(30, 144, 255, 0.6),
    const Color.fromRGBO(138, 43, 226, 0.5),
    const Color.fromRGBO(72, 61, 139, 0.5),
    Colors.orange.shade300,
  ];

  // Default container color
  final List<Color> colorList = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  // Default icon Container color
  final List<Color> conList = [
    const Color.fromRGBO(30, 144, 255, 0.6),
    const Color.fromRGBO(138, 43, 226, 0.5),
    const Color.fromRGBO(72, 61, 139, 0.5),
    Colors.orange.shade300,
    // Add more colors as needed
  ];
  final chp = [
    'Units and Measurement',
    'Motion in Straight Line',
    'Motion in Plane',
    'Laws of Motion',
    'Work, Energy and Power',
    'System of Particles and Rotational Motion',
    'Gravitational',
    'Mechanical Properties of Solids',
    'Mechanical Properties of Fluids',
    'Thermal Properties of Matter',
    'Thermodynamics',
    'Kinetic Theory',
    'Oscillations',
    'Waves'
  ];

  final List<Widget> click = [
    PhysicsVideos(),
    const MathsVideos(),
    const ChemistryVideos(),
    const BioVideos()
  ];

  List images = ['bg.jpg', 'bg.jpg', 'bg.jpg'];

  List<IconData> iconNames = [
    Icons.subject_rounded,
    Icons.add_a_photo_rounded,
    Icons.add_a_photo_rounded,
    Icons.add_a_photo_rounded,
    Icons.add_a_photo_rounded,
    Icons.add_a_photo_rounded,
  ];

  List<String> itemTexts = [
    'Subject',
    'Textbook',
    'PYQ',
    'Quiz',
    'Item 5',
    'Item 6',
  ];

  List<bool> selectedItems = List.filled(6, false);

  Color defaultContainerColor = const Color.fromRGBO(30, 144, 255, 0.6);
  Color defaultTextColor = Colors.black;
  Color defaultIconColor = Colors.white;

  bool isDataLoaded = false;



  @override
  void initState() {
    super.initState();
    // Fetch data from the backend only once
    loadBackendData();
  }

  Future<void> loadBackendData() async {
    try {
      testimonials = await UserService.postAllUserData();
      homePhotos = await homepic.postAllHomePhoto();
      isDataLoaded = true;
    } catch (error) {
      print('Error loading data: $error');
    }
    // Force a re-render of the widget
    setState(() {});
  }

  void _changeColors(int index) {
    setState(() {
      for (int i = 0; i < selectedItems.length; i++) {
        if (i == index) {
          selectedItems[i] = !selectedItems[i];
        } else {
          selectedItems[i] = false;
        }
      }
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        selectedItems = List.filled(selectedItems.length, false);
      });
    });
  }

  List<Widget> generateContainers(
      List<String> texts, List<IconData> icons, List<int> indexes) {
    return List.generate(texts.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(
            top: 15.0, bottom: 8, left: 15, right: 15),
        child: GestureDetector(
          onTap: () {
            _changeColors(indexes[index]);
            _navigateToPage(indexes[index]);
          },
          child: Container(
            width: 160,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: selectedItems[indexes[index]]
                  ? conList[indexes[index]]
                  : colorList[indexes[index] % colorList.length],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: selectedItems[indexes[index]]
                          ? colorList[indexes[index]]
                          : conList[indexes[index] % colorList.length],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icons[index],
                        color: selectedItems[indexes[index]]
                            ? conList[indexes[index]]
                            : defaultIconColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    texts[index],
                    style: TextStyle(
                      color: selectedItems[indexes[index]]
                          ? Colors.white
                          : defaultTextColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void _navigateToPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Course()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Textbook()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionPapersPage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Access the email from the provider
    String? Demail = userProvider.email;
    // Media query for screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Media query for screen height
    double screenHeight = MediaQuery.of(context).size.height;

    // You can use screenWidth and screenHeight to make responsive adjustments

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () => _changeColors(-1),
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    pinned: true,
                    expandedHeight: 150,
                    flexibleSpace: FlexibleSpaceBar(
                      title: FutureBuilder(
                        future: fetchUserDetails(Demail!), // Replace 'user_email' with the user's email
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final user = snapshot.data;
                            print(user);
                            // Retrieve the user's name from the data
                            final userName = user?['name'];

                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Text(userName, style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  ),
                                ), // Display the user's name

                                // Add more fields as needed
                              ],
                            );
                          } else {
                            return Text('No data available');
                          }
                        },
                      ),
                      background: Stack(
                        children: [
                          Image.asset(
                            "assets/images/sil.jpg",
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                           Positioned(
                            bottom: 25,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello,',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                FutureBuilder(
                                  future: fetchUserDetails(Demail!), // Replace 'user_email' with the user's email
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      final user = snapshot.data;
                                        print(user);
                                      // Retrieve the user's name from the data
                                      final userName = user?['name'];

                                      return Column(
                                        children: [
                                          Text(userName, style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          ), // Display the user's name

                                          // Add more fields as needed
                                        ],
                                      );
                                    } else {
                                      return Text('No data available');
                                    }
                                  },
                                ),

                              ],
                            ),
                          ),
                           Positioned(
                            top: 30,
                            right: 30,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
                              },
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/profile.jpg'), // Replace with the actual user photo
                                radius: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    automaticallyImplyLeading: false,
                  ),
                ];
              },
              body: SingleChildScrollView(
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Courses",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CustomFont',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: generateContainers(
                          ['Subject', 'Textbook'],
                          [Icons.subject_rounded, Icons.book],
                          [0, 1],
                        ),
                      ),
                      Row(
                        children: generateContainers(
                          ['PYQ', 'Quiz'],
                          [Icons.question_answer , Icons.quiz],
                          [2, 3],
                        ),
                      ),
                      FutureBuilder<dynamic>(
                        future: homepic.postAllHomePhoto(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else if (snapshot.hasData) {
                            List<dynamic> HomePic = snapshot.data!;
                            return Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 324,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: HomePic.length,
                                      itemBuilder: (context, index) {
                                        Map<String, dynamic> item =
                                        HomePic[index];
                                        return Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: SizedBox(
                                            width: 250,
                                            child: Stack(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                            click[index]));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            20)),
                                                    child: Container(
                                                      child: Image.network(
                                                        item['Photo'],
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        bottom: 16),
                                                    child: Align(
                                                      alignment:
                                                      Alignment.bottomCenter,
                                                      child: Card(
                                                        color:
                                                        colorVideoList[index],
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize.min,
                                                            children: [
                                                              Text(
                                                                item['subname'],
                                                                style:
                                                                const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 8),
                                                              const Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .video_library,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20,
                                                                  ),
                                                                  SizedBox(
                                                                      width: 4),
                                                                  Text(
                                                                    "10 Lecture Videos",
                                                                    style:
                                                                    TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: Text('Invalid data format'),
                            );
                          }
                        },
                      ),
                      Container(
                        child: Column(
                          children: [
                             Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Testimonial",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyForm()));
                                    },
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FutureBuilder<dynamic>(
                              future: UserService.postAllUserData(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else if (snapshot.hasData) {
                                  List<dynamic> testimonials = snapshot.data!;
                                  return CarouselSlider(
                                    options: CarouselOptions(
                                      height: 200,
                                      aspectRatio: 16 / 9,
                                      scrollDirection: Axis.horizontal,
                                      viewportFraction: 0.8,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval:
                                      const Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      onPageChanged: (index, reason) {
                                        // Do something when the page changes
                                      },
                                      scrollPhysics:
                                      const BouncingScrollPhysics(),
                                    ),
                                    items: testimonials.map((testimonial) {
                                      String name = testimonial['name'];
                                      String testimonialText =
                                      testimonial['testimonial'];

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              Image.asset(
                                                'assets/images/rm118-ken-12.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.black
                                                          .withOpacity(0.3),
                                                      Colors.transparent
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      name,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 13.0,right: 13),
                                                      child: Text(
                                                        testimonialText,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                            const SizedBox(height: 100,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Images extends StatelessWidget {
  final String img;

  const Images({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage('assets/images/$img'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

