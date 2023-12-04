import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projectui/profile.dart';
import 'package:projectui/tryprofile.dart';
import 'package:projectui/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Info.dart';
import 'Privacy.dart';
import 'Report.dart';
import 'TermndCondition.dart';
import 'login.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingState();
}

class _SettingState extends State<Setting> with SingleTickerProviderStateMixin {
  GlobalKey<NavigatorState> _myProfileNavigatorKey = GlobalKey<NavigatorState>();

  double userRating = 3.0;
  // Save user rating to SharedPreferences with a user identifier
  Future<void> saveUserRating(String userIdentifier, double rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('userRating_$userIdentifier', rating);
  }

// Retrieve user rating from SharedPreferences using a user identifier
  Future<double?> getUserRating(String userIdentifier) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? rating = prefs.getDouble('userRating_$userIdentifier');
    return rating;
  }

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Access the email from the provider
    String? Demail = userProvider.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // This will navigate back as expected.
          },
        ),
        title: const Text(
          "Setting",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text(
              "V 6.86.0",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
  /*        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(11, 72, 107, 50),
              Color.fromRGBO(245, 98, 23, 50),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),*/
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                 /* Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: Colors.teal,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child:  Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage:
                                      AssetImage('assets/images/profile.jpg'),
                                    ),
                                    SizedBox(
                                      width: 180,
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
                                        },
                                        child: ListTile(
                                          title:  FutureBuilder(
                                            future: fetchUserDetails(Demail!), // Replace 'user_email' with the user's email
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              } else if (snapshot.hasError) {
                                                return Text('Error: ${snapshot.error}');
                                              } else if (snapshot.hasData) {
                                                final user = snapshot.data;

                                                // Retrieve the user's name from the data
                                                final userName = user?['name'];

                                                return Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(userName, style: TextStyle(
                                                      fontSize: 20,
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

                                          subtitle:  Text(
                                            'Student \n $userRating ',
                                            style: TextStyle(fontSize: 15, color: Colors.black,),

                                          ),
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
                    ),
                  ),*/
                /*  _buildCard(
                    "My Account",
                    [
                      _buildCardItem(
                        Icons.supervised_user_circle_sharp,
                        "Profile",
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Info(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),*/
                  _buildCard(
                    "Feedback",
                    [
                      _buildCardItem(
                        Icons.star_rate_rounded,
                        "Rate the app",
                            () {
                          _showModalBottomSheet3(context);
                        },
                      ),
                      _buildCardItem(
                        Icons.report_problem_rounded,
                        "Report a problem",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Report(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                /*  _buildCard(
                    "System",
                    [
                      _buildCardItem(
                        Icons.dark_mode_rounded,
                        "Dark mode",
                        () {
                        //  _showModalBottomSheet2(context, _toggleDarkMode);

                        },
                      ),
                    ],
                  ),*/

                  _buildCard(
                    "Legal",
                    [
                      _buildCardItem(
                        Icons.privacy_tip_rounded,
                        "Privacy policy",
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Privacy(),
                            ),
                          );
                        },
                      ),
                      _buildCardItem(
                        Icons.article_rounded,
                        "Terms & Conditions",
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TermCondition(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  _buildCard(
                    "Account",
                    [
                      _buildCardItem(
                        Icons.logout_rounded,
                        "Sign out",
                        () {
                          _showModalBottomSheet(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, List<Widget> items) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(),
          Column(
            children: items,
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem(IconData icon, String title, VoidCallback onPressed) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color.fromRGBO(245, 98, 23, 50),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Color.fromRGBO(11, 72, 107, 50),
        ),
      ),
      onTap: onPressed,
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Are you sure you want to sign out?'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> MyLogin()));},
                  child: const Text('Sign out'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showModalBottomSheet2(BuildContext context,VoidCallback toggleDarkMode) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                    onTap: (){
                      toggleDarkMode();
                      Navigator.pop(context);
                    },
                    child: const Text('Toggle dark mode')
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showModalBottomSheet3(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        double updatedUserRating = userRating;
        return Container(
          height: 200,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Rate the app'),
                const SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: updatedUserRating,
                  minRating: 2,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 40,
                  unratedColor: Colors.grey[300],
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      updatedUserRating = rating; // Update the local variable and trigger a UI update
                    });
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final userProvider = Provider.of<UserProvider>(context, listen: false);
                    String? userIdentifier = userProvider.email;
                    print(userIdentifier);

                    if (userIdentifier != null) {
                      await saveUserRating(userIdentifier, updatedUserRating); // Save user rating
                      setState(() {
                        userRating = updatedUserRating; // Update the main userRating with the local variable
                      });
                      Navigator.pop(context);
                      print(userRating);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
