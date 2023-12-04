import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:projectui/login.dart';
import 'package:projectui/navbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'main.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nameError = '';
  String emailError = '';
  String phoneNumberError = '';
  String passwordError = '';


  void resetErrors() {
    setState(() {
      nameError = '';
      emailError = '';
      phoneNumberError = '';
      passwordError = '';
    });
  }

  Future<void> registerUser() async {
    resetErrors(); // Clear any previous errors
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty) {
      setState(() {
        nameError = 'Name is required.';
      });
    }else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
      setState(() {
        nameError = 'Name should only contain characters.';
      });
    }
    if (email.isEmpty) {
      setState(() {
        emailError = 'Email is required.';
      });
    }else {
      // Trim the value and then check if it's a valid email
      final trimmedValue = email;
      if (!isValidEmail(trimmedValue)) {
        setState(() {
          emailError = 'Invalid email address';
        });
      }
    }
    if (phoneNumber.isEmpty) {
      setState(() {
        phoneNumberError = 'Phone number is required.';
      });
    }else if (!isValidPhone(phoneNumber)) {
      phoneNumberError = 'Invalid phone number';
    }else if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      phoneNumberError = 'Invalid number format';
    }


    if (password.isEmpty) {
        setState(() {
          passwordError = 'Password is required.';
        });
      }else if (password.length < 8) {
      passwordError = 'Password must be at least 8 characters long';
    }

      if (nameError.isNotEmpty ||
          passwordError.isNotEmpty ||
          emailError.isNotEmpty ||
          phoneNumberError.isNotEmpty) {
        // At least one field has an error, do not proceed with registration.
        return;
      }

      final response = await http.post(
        Uri.parse('$globalapi/register/'),
        body: {
          'Name': name,
          'Email': email,
          'Num': phoneNumber,
          'Pass': password,
        },
      );

      if (response.statusCode == 200) {
        resetErrors(); // Clear any previous errors
        // Registration successful
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyLogin()),
        );
      } else {
        // Registration failed, handle errors here
        final responseData = json.decode(response.body);
        final errorData = responseData['error'];

        setState(() {
          emailError = errorData == 'User with this email already exists.'
              ? errorData
              : '';
          passwordError = errorData == 'Password length should be at least 8 characters.'
              ? errorData
              : '';
          nameError = errorData == 'Name should only contain characters.'
              ? errorData
              : '';
          phoneNumberError = errorData == 'Phone number should only contain digits and have a length of 10.'
              ? errorData
              : '';
        });
      }
    }






  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35,top: 50),
                  child: Text(
                    'Create\nAccount',
                    style: TextStyle(color: Colors.white, fontSize: 33),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: nameController,
                              decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Name",
                                  errorText: nameError.isNotEmpty ? nameError : null,
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username cannot be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: phoneNumberController,
                              decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Phone Number",
                                  errorText: phoneNumberError.isNotEmpty ? phoneNumberError : null,
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone number cannot be empty';
                                } else if (!isValidPhone(value)) {
                                  return 'Invalid phone number';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: emailController,
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Email",
                                  errorText: emailError.isNotEmpty ? emailError : null,
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email cannot be empty';
                                } else {
                                  // Trim the value and then check if it's a valid email
                                  final trimmedValue = value.trim();
                                  if (!isValidEmail(trimmedValue)) {
                                    return 'Invalid email address';
                                  }
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Password",
                                  errorText: passwordError.isNotEmpty ? passwordError : null,
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password cannot be empty';
                                } else if (value.length < 8) {
                                  return 'Password must be at least 8 characters long';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        registerUser();
                                         // Navigator.push(context, MaterialPageRoute(builder: (context)=> Nav_Bar()));
                                        },

                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyLogin()));
                                    },
                                    child: Text(
                                      'Sign In',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                  ),
                                  style: ButtonStyle(),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }

  bool isValidPhone(String phone) {
    return phone.length == 10;


  }
}