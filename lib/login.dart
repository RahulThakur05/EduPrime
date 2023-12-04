import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:projectui/Resetpwd.dart';
import 'package:projectui/navbar.dart';
import 'package:projectui/register.dart';
import 'package:projectui/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

TextEditingController emailController = TextEditingController();
final Demail = emailController.text; // Extract the text from the controller
Future<void> DupdateLastPlayedVideo(String videoUrl, String videoTitle, String videoDescription) async {
  final apiUrl = '$globalapi/update_last_played_video/';
  try {
    if (Demail != null) {
      final email = emailController.text;
      final response = await http.post(


        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'User-Email': email, // Send the user's email in the headers
        },
        body: jsonEncode({
          'User-Email': email,
          'video_url': videoUrl,
          'video_title': videoTitle,
          'video_description': videoDescription,
        }),
      );

      if (response.statusCode == 200) {
        // Handle success
        print('Last played video updated successfully');
      } else {
        // Handle error
        print('Failed to update the last played video');
      }
    } else {
      // Handle the case where the user's email is not available (user is not logged in)
      print('User not authenticated, please log in');
    }
  } catch (e) {
    print('Error: $e');
  }
}


Future<Map<String, dynamic>> fetchUserDetails(String email) async {
  final response = await http.get(Uri.parse('$globalapi/api/user/$email/'));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userEmail', Demail);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
  return data;
  } else {
    throw Exception('Failed to load user details');
  }
}

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  int _lastBackPressed = 0;
  //TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String emailErrorText = '';
  String passwordErrorText = '';
  String newPasswordErrorText = '';
  String confirmPasswordErrorText = '';

  bool forgotPassword = false;

  void toggleForgotPassword() {
    setState(() {
      forgotPassword = !forgotPassword;
    });
  }

  Future<void> updatepswd() async {
    if (forgotPassword) {
      final newPassword = newPasswordController.text;
      final confirmPassword = confirmPasswordController.text;

      // Validate new password and confirmation
      if (newPassword.isEmpty || confirmPassword.isEmpty) {
        setState(() {
          newPasswordErrorText =
          newPassword.isEmpty ? 'New password is required.' : '';
          confirmPasswordErrorText =
          confirmPassword.isEmpty ? 'Confirmation is required.' : '';
        });
        return;
      }

      if (newPassword != confirmPassword) {
        setState(() {
          newPasswordErrorText = 'Passwords do not match.';
          confirmPasswordErrorText = 'Passwords do not match.';
        });
        return;
      }

      // Call the API to update the password
      final response = await http.post(
        Uri.parse('$globalapi/reset_password/'), // Replace with your API endpoint
        body: {
          'Email': emailController.text,
          'NewPassword': newPassword,
        },
      );

      if (response.statusCode == 200) {
        newPasswordController.clear();
        confirmPasswordController.clear();
        toggleForgotPassword();
      } else {
        // Handle API errors
        final data = json.decode(response.body);
        final errorMessage = data['error'];

        // Set the error message received from the backend.
        setState(() {
          newPasswordErrorText =
          errorMessage == 'Invalid new password.' ? errorMessage : '';
          confirmPasswordErrorText =
          errorMessage == 'Invalid new password.' ? errorMessage : '';
        });
      }
    }
  }

  void login() async {
    final email = emailController.text;
    final password = passwordController.text;


    if (email.isEmpty || password.isEmpty) {
      // If email or password is empty, show an error message.
      setState(() {
        emailErrorText = email.isEmpty ? 'Email is required.' : '';
        passwordErrorText = password.isEmpty ? 'Password is required.' : '';
      });
      return;
    }


    final response = await http.post(
      Uri.parse('$globalapi/login/'), // 192.168.43.87:8000 Replace with your API endpoint
      body: {
        'Email': email,
        'Pass': password,
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        emailErrorText = '';
        passwordErrorText = '';
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => Nav_Bar()));
    }  else {
      final data = json.decode(response.body);
      print(response.body);
      final errorMessage = data['error'];

      // Set the error message received from the backend.
      setState(() {
        emailErrorText = errorMessage == 'User does not exist.' ? errorMessage : '';
        passwordErrorText = errorMessage == 'Incorrect password.' ? errorMessage : '';
      });
    }

  }


  @override
  void initState() {
    super.initState();
    fetchUserDetails(Demail);

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  () async {
        int now = DateTime.now().millisecondsSinceEpoch;
        if (now - _lastBackPressed > 1500) {
          // If it's been more than 1.5 seconds since the last press, reset the timer.
          _lastBackPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Press back again to exit'),
            ),
          );
          return false; // Prevent app from exiting.
        } else {
          // If the user double-clicked within 1.5 seconds, exit the app.
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return true; // Allow the app to exit.
        }
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(),
              Container(
                padding: EdgeInsets.only(left: 35, top: 160),
                child: Text(
                  'Welcome\nBack',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextField(
                              controller: emailController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.black),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                errorText: emailErrorText.isNotEmpty ? emailErrorText : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: passwordController,
                              style: TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.black),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                errorText: passwordErrorText.isNotEmpty ? passwordErrorText : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27, fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      final userProvider =
                                      Provider.of<UserProvider>(context, listen: false);

                                      // Get the email from the TextField
                                      String email = emailController.text;

                                      // Set the email using the provider
                                      userProvider.setEmail(email);
                                      login();
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyRegister()));
                                    },
                                    child: Text(
                                      'Sign Up',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xff4c505b),
                                          fontSize: 18),
                                    ),
                                  ),
                                  style: ButtonStyle(),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPwd()));
                                      },
                                      child: Text(
                                        'Forgot Password',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xff4c505b),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
