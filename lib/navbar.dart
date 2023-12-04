import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projectui/HomePage.dart';
import 'package:projectui/search.dart';
import 'package:projectui/tryprofile.dart';


import 'LibraryUi.dart';

class Nav_Bar extends StatefulWidget {
  const Nav_Bar({Key? key}) : super(key: key);

  @override
  State<Nav_Bar> createState() => _Nav_BarState();
}

class _Nav_BarState extends State<Nav_Bar> {
  int _selectedIndex = 0;

  // Pages to navigate to
  final List<Widget> _pages = [
    HomePage(),
    CardsHome(),
    SearchPage(),
    MyProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Set the default page as HomePage when the widget is initialized
    _selectedIndex = 0;
  }

  void _onTabChange(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  final List<Color> conList = [
    const Color.fromRGBO(30, 144, 255, 0.6),
    const Color.fromRGBO(138, 43, 226, 0.5),
    Colors.orange.shade300,
    const Color.fromRGBO(72, 61, 139, 0.5),
    // Add more colors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
          // IndexedStack to manage the navigation between pages
          IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          // GNav at the bottom of the screen
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90,
              color:  Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                child: GNav(
                  backgroundColor: Colors.white,

                  color: Colors.black,
                  activeColor: Colors.white,
                  tabBackgroundColor: conList[_selectedIndex],
                  gap: 8,
                  selectedIndex: _selectedIndex,
                  onTabChange: _onTabChange,
                  padding: EdgeInsets.all(16),
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                   /* GButton(
                      icon: Icons.favorite_border,
                      text: 'Wishlist',
                    ),*/
                    GButton(
                      icon: Icons.collections_bookmark_outlined,
                      text: 'Library',
                    ),
                    GButton(
                      icon: Icons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Setting',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
