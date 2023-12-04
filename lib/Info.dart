import 'package:flutter/material.dart';
import 'package:projectui/user_provider.dart';
import 'package:provider/provider.dart';

import 'InfoDetails.dart';
import 'Setting.dart';
import 'login.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Info();
}

class _Info extends State<Info> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Access the email from the provider
    String? Demail = userProvider.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Setting()));
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child:   FutureBuilder(
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
                final userEmail = user?['email'];
                final userNum = user?['num'];

                return Column(
                  children: [
                    const Text(
                      "Name                                                                                                                           ",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Editname()));
                      },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            userName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        "Email address                                                                                                                           ",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => editEmail()));
                      },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            userEmail,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        "Mobile number                                                                                                                           ",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "+91{$userNum}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        "Username                                                                                                                           ",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => editUsername()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "rahulvinodthakur1234abc",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        "Bio                                                                                                                           ",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Bio()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add few words about yourself",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Text('No data available');
              }
            },
          ),
        ),
      ),
    );
  }
}
