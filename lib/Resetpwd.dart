import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectui/main.dart';

import 'login.dart';

class ResetPwd extends StatefulWidget {
  const ResetPwd({Key? key}) : super(key: key);

  @override
  _ResetPwdState createState() => _ResetPwdState();
}

class _ResetPwdState extends State<ResetPwd> {
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String emailErrorText = '';
  String newPasswordErrorText = '';
  String confirmPasswordErrorText = '';

  Future<void> updatePassword() async {
    final email = emailController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    // Validate new password and confirmation
    if (email.isEmpty) {
      setState(() {
        emailErrorText =
        newPassword.isEmpty ? 'Email is required.' : '';
      });

    } else if
      (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
        emailErrorText = 'Invalid number format';
      }
    
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
    final apiUrl = '$globalapi/reset_password/'; // Replace with your API endpoint

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'Email': email,
          'NewPassword': newPassword,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        newPasswordController.clear();
        confirmPasswordController.clear();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyLogin()),
        );
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
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 60),
              child: Text(
                'Re-Set\nPassword',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
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
                              errorText:
                              emailErrorText.isNotEmpty ? emailErrorText : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: newPasswordController,
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              errorText: newPasswordErrorText.isNotEmpty
                                  ? newPasswordErrorText
                                  : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: confirmPasswordController,
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Confirm Password",
                              errorText: confirmPasswordErrorText.isNotEmpty
                                  ? confirmPasswordErrorText
                                  : null,
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
                                'Re-Set',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    updatePassword();
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                  ),
                                ),
                              )
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
    );
  }
}
