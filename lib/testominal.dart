import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController testimonialController = TextEditingController();
  bool isButtonEnabled = false;

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      String testimonial = testimonialController.text;

      // API endpoint URL
      String apiUrl = '$globalapi/save_testimonial_data/';

      // Create a POST request with the user input data
      var response = await http.post(Uri.parse(apiUrl), body: {
        'name': name,
        'testimonial': testimonial,
      });

      if (response.statusCode == 200) {
        // Data saved successfully
        print('Data saved successfully');

        // Clear text fields after successful submission
        setState(() {
          nameController.clear();
          testimonialController.clear();
        });
      } else {
        // Error saving data
        print('Error saving data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Give Your Testimonial'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/testi.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name cannot be empty';
                      }
                      if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                        return 'Name should contain only characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                      labelStyle: TextStyle(color: Color.fromRGBO(255, 252, 183, 1.0)), // Text color
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(255, 252, 183, 1.0)), // Border color
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]+")),
                    ],
                      cursorColor: Color.fromRGBO(255, 252, 183, 1.0), // Set the text cursor color
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0))
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: testimonialController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Testimonial cannot be empty';
                      }
                      return null;
                    },
                    maxLines: 5,
                    decoration:  InputDecoration(
                      labelText: 'Enter your testimonial',
                      labelStyle: TextStyle(color: Color.fromRGBO(255, 252, 183, 1.0)), // Text color
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(255, 252, 183, 1.0)), // Border color
                      ),
                    ),
                      cursorColor: Color.fromRGBO(255, 252, 183, 1.0), // Set the text cursor color
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0))
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && (nameController.text.isNotEmpty && testimonialController.text.isNotEmpty)) {
                        submitForm();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: isButtonEnabled
                          ? Color.fromRGBO(255, 252, 183, 1.0)
                          : Colors.grey, // Change button color based on validation
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 53, 24, 0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
