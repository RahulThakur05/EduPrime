import 'package:flutter/material.dart';
import 'package:projectui/Info.dart';
import 'package:projectui/main.dart';
import 'package:projectui/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Fyqs.dart';
import 'Setting.dart';
import 'login.dart';
import 'package:share_plus/share_plus.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int questionsAttended = 0;
  int totalMinutesWatched = 0;
  Future<void> fetchData() async {
    final userProvider = Provider.of<UserProvider>(context,listen: false);

    // Access the email from the provider
    String? email = userProvider.email;
    final response = await http.get(
      Uri.parse('$globalapi/usr_details/$email/'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      setState(() {
        questionsAttended = data['questions_attended'];
        totalMinutesWatched = data['total_minutes_watched'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
  double userRating = 3.0;
  Future<double> getUserRatingOrDefault(String userIdentifier, double defaultValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? rating = prefs.getDouble('userRating_$userIdentifier');
    return rating ?? defaultValue;
  }


  Uri dialnumber =Uri(scheme: 'tel', path: '9022420488');
  directcall()async{
    await launchUrl(dialnumber);
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Access the email from the provider
    String? Demail = userProvider.email;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromRGBO(30, 144, 255, 0.6),
                  const Color.fromRGBO(138, 43, 226, 0.5),
                  const Color.fromRGBO(72, 61, 139, 0.5),
                  Colors.orange.shade300,
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Colors.transparent,
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
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Info()));
                                },
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
                                                      fontSize: 50,
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

                                          subtitle: FutureBuilder<double>(
                                        future: getUserRatingOrDefault(Demail!,3.0), // Use 3.0 as the default rating
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          } else if (snapshot.hasError) {
                                            return Text('Error: ${snapshot.error}');
                                          } else if (snapshot.hasData) {
                                            final userRating = snapshot.data;

                                            return Text(
                                              'Student \n $userRating ',
                                              style: TextStyle(fontSize: 50, color: Colors.black,),
                                            );
                                          } else {
                                            return Text('No data available');
                                          }
                                        },
                                      )

                                    ),
                                      ),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                  /*      const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 180,
                              child: Card(
                                color: Color.fromRGBO(248, 248, 255, 30),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.video_camera_front_rounded),
                                      SizedBox(width: 8),
                                      Text(
                                        "Enrollment",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              width: 180,
                              child: Card(
                                  color: Color.fromRGBO(248, 248, 255, 30),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.download_done_rounded),
                                        SizedBox(width: 8),
                                        Text(
                                          "Download",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),*/
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 180,
                              child: Card(
                                  color: Color.fromRGBO(248, 248, 255, 30),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.update),
                                        SizedBox(width: 8),
                                        Text(
                                          "Updates",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 70,
                              width: 180,
                              child: Card(
                                color: Color.fromRGBO(248, 248, 255, 30),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                          Icons.supervised_user_circle_rounded),
                                      SizedBox(width: 8),
                                      Text(
                                        "educators",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 180,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Fyqs()),
                                  );
                                },
                                child: const Card(
                                  color: Color.fromRGBO(248, 248, 255, 30),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.question_mark_rounded),
                                        SizedBox(width: 8),
                                        Text(
                                          "FAQs",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              width: 180,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Setting()),
                                  );
                                },
                                child: const Card(
                                  color: Color.fromRGBO(248, 248, 255, 30),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.settings),
                                        SizedBox(width: 10),
                                        Text(
                                          "Setting",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height: 120,
                                      child: Text(
                                        "Refer friends to win Amazon vouchers and Plus Subscription"
                                        "For every successful referral win up to 2,500rs. Also get 1 month plus subscription once.",
                                        style: TextStyle(
                                            fontSize: 14, fontFamily: "Roboto"),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      height: 130,
                                      child: Card(
                                        elevation: 2,
                                        child: Image.asset(
                                          'assets/images/1.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                onPressed:directcall,
                                /*async{
                                  Uri phoneno = Uri.parse('tel:+97798345348734');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  }else{
                                    //dailer is not opened
                                  }
                                },*/
                                child: const Text("Refer a Friend")),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "STATS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Algerian",
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                                Text(
                                  "ALL TIME",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Algerian",
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                 /*         Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 160,
                                  child: Card(
                                    child: ListTile(
                                      title: Text(
                                        "TOTAL WATCH MINS",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      subtitle: Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  width: 160,
                                  child: Card(
                                    child: ListTile(
                                      title: Text(
                                        "LESSONS COMPLETED",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      subtitle: Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),*/
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 160,
                                  child: Card(
                                    child: ListTile(
                                      title: Text(
                                        "QUESTIONS ATTEMPTED",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      subtitle: Text(
                                        questionsAttended.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  width: 160,
                                  child: Card(
                                    child: ListTile(
                                      title: Text(
                                        "TOTAL MIN WATCH",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      subtitle: Text(
                                        totalMinutesWatched.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
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
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
