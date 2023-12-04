import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:projectui/Fyqs.dart';
import 'package:projectui/Report.dart';
import 'package:projectui/Setting.dart';
import 'package:sizer/sizer.dart';
import 'package:projectui/main.dart';
import 'package:projectui/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:share_plus/share_plus.dart';
import 'login.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  static String routeName = 'MyProfileScreen';

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
   String? userName;
   String? userEmail;
   String? userNum;

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
      //app bar theme for tablet
      appBar: AppBar(
        title: Text('My Profile'),
        automaticallyImplyLeading: false,
        actions: [
          Container(
             padding: EdgeInsets.only(right: kDefaultPadding / 2),
             child: GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Report()));
                 },

               child: Row(
                 children: [
                   Icon(Icons.report_gmailerrorred_outlined),
                   kHalfWidthSizedBox,
                   Text(
                     'Report',
                     style: Theme.of(context).textTheme.subtitle2,
                   ),
                 ],
               ),
             ),
           ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kOtherColor,
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: SizerUtil.deviceType == DeviceType.tablet ? 19.h : 15.h,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: kBottomBorderRadius,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius:
                      SizerUtil.deviceType == DeviceType.tablet ? 12.w : 13.w,
                      backgroundColor: kSecondaryColor,
                      backgroundImage:
                      AssetImage('assets/images/profile.jpg'),
                    ),
                    kWidthSizedBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder(
                          future: fetchUserDetails(Demail!), // Replace 'user_email' with the user's email
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              final user = snapshot.data;

                              // Retrieve the user's name from the data
                               userName = user?['name'];
                               userEmail = user?['email'];
                               userNum = user?['num'];


                              return Text(userName!,
                                style: const TextStyle(color: Colors.white,fontSize: 28),

                              );
                            } else {
                              return Text('No data available');
                            }
                          },
                        ),
                        Text('Student',
                            style: TextStyle(color: Colors.white,fontSize: 18),
                        ),
                        FutureBuilder<double>(
                          future: getUserRatingOrDefault(Demail!,3.0), // Use 3.0 as the default rating
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              final userRating = snapshot.data;

                              return Text(
                                '$userRating ',
                                  style: TextStyle(color: Colors.white,fontSize: 18),
                              );
                            } else {
                              return Text('No data available');
                            }
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(
                      title: 'Updates', value: 'Last updated \n7 Oct 23', icon: Icons.update,),
                  ProfileDetailRow(title: 'Educators', value: 'Your guide for\n2023-2024', icon: Icons.people,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Fyqs()));
                      },
                      child: ProfileDetailRow(title: 'FAQs', value: 'Questions Asked', icon: Icons.question_mark,)
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
                      },
                      child: ProfileDetailRow(title: 'Setting', value: 'V 6.86.0', icon: Icons.settings,)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(
                      title: 'Questions \nAttempted', value: questionsAttended.toString(), icon: Icons.quiz,),
                  ProfileDetailRow(title: 'Total Min \nWatch', value: '30 Min', icon: Icons.video_library,),
                ],
              ),
              sizedBox,
              FutureBuilder(
                future: fetchUserDetails(Demail!), // Replace 'user_email' with the user's email
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final user = snapshot.data;

                    userEmail = user?['email'];
                  

                    return  ProfileDetailColumn(
                      title: 'Email',
                      value: userEmail!, icon: Icons.lock_clock_outlined,
                    );
                  } else {
                    return Text('No data available');
                  }
                },
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

                    userNum = user?['num'];


                    return  ProfileDetailColumn(
                      title: 'Phone Number',
                      value: '+91$userNum', icon: Icons.phone,
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              ),

              const ProfileDetailColumn(
                title: 'Refer & Earn',
                value: 'Refer friends to win a free Fingertips NCERT \nreference book from Amazon in our app!', icon: Icons.local_offer,
              ),
              SizedBox(height: 100,)

            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({Key? key, required this.title, required this.value,required this.icon,})
      : super(key: key);
  final String title;
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: kTextBlackColor,
                  fontSize: SizerUtil.deviceType == DeviceType.tablet
                      ? 15.sp
                      : 12.sp,
                ),
              ),
              kHalfSizedBox,
              Text(value, style: Theme.of(context).textTheme.caption?.copyWith(
                fontSize: 13, // Change the font size to your desired value
              ),),
              kHalfSizedBox,
              SizedBox(
                width: 35.w,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          Icon(
            icon,
            size: 15.sp,
          ),
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {Key? key, required this.title, required this.value, required this.icon})
      : super(key: key);
  final String title;
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Share.share('Check out my website https://example.com');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: kTextBlackColor,
                    fontSize: SizerUtil.deviceType == DeviceType.tablet
                        ? 7.sp
                        : 13.sp,
                  ),
                ),
                kHalfSizedBox,
                Text(value, style: Theme.of(context).textTheme.caption?.copyWith(
                  fontSize: 13, // Change the font size to your desired value
                ),),
                kHalfSizedBox,
                SizedBox(
                  width: 92.w,
                  child: Divider(
                    thickness: 1.0,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: (){
                  Share.share('https://pub.dev/packages/share_plus');
              },
              child: Padding(
                padding: const EdgeInsets.only(left:11.0),
                child: Icon(
                  icon,
                  size: 15.sp,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

//colors
const Color kPrimaryColor = Color(0xFF345FB4);
const Color kSecondaryColor = Color(0xFF6789CA);
const Color kTextBlackColor = Color(0xFF313131);
const Color kTextWhiteColor = Color(0xFFFFFFFF);
const Color kContainerColor = Color(0xFF777777);
const Color kOtherColor = Color(0xFFF4F6F7);
const Color kTextLightColor = Color(0xFFA5A5A5);
const Color kErrorBorderColor = Color(0xFFE74C3C);

//default value
const kDefaultPadding = 20.0;

const sizedBox = SizedBox(
  height: kDefaultPadding,
);
const kWidthSizedBox = SizedBox(
  width: kDefaultPadding,
);

const kHalfSizedBox = SizedBox(
  height: kDefaultPadding / 2,
);

const kHalfWidthSizedBox = SizedBox(
  width: kDefaultPadding / 2,
);

final kTopBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
  topRight:
  Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
);

final kBottomBorderRadius = BorderRadius.only(
  bottomRight: Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
  bottomLeft:
  Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
);

final kInputTextStyle = GoogleFonts.poppins(
    color: kTextBlackColor,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500
);

//validation for mobile
const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

//validation for email
const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';