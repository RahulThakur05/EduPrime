import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectui/tryprofile.dart';

import 'Setting.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Report();
}

class _Report extends State<Report> {
  final List<bool> _isChecked = [false, false, false, false, false];
  List<File> selectedImages = [];
  List<XFile> cameraImages = [];

  bool imageUploaded = false;


  void _showSnackBar(BuildContext context) {
    if (imageUploaded) {
      // Only show the SnackBar when an image is uploaded
      final snackBar = SnackBar(
        content: Text("Report submitted. We will get back to you soon."),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  /// Get from camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // Save the captured image to the device's photo gallery
      final result = await ImageGallerySaver.saveFile(pickedFile.path);
      print(result); // This will print the result of the save operation

      setState(() {
        cameraImages.add(pickedFile);
      });
    }
  }

  /// Get from gallery
  _getFromGallery() async {
    List<XFile>? pickedFiles = await ImagePicker().pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );

    return pickedFiles ?? [];
  }

  void _openImageSheet() async {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 210,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Add Photos",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Select how u would like to add the photo",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context); // Close the bottom sheet
                  List<XFile> pickedFiles = await _getFromGallery();

                  if (pickedFiles.isNotEmpty) {
                    selectedImages.addAll(
                        pickedFiles.map((pickedFile) => File(pickedFile.path)));
                    selectedImages.addAll(cameraImages
                        .map((pickedFile) => File(pickedFile.path)));
/*
                    await Future.delayed(Duration(
                        milliseconds: 500)); // Allow animations to complete

                    if (selectedImages.length == 7) {
                      print('Selected Images Count: ${selectedImages.length}');

                      // Upload images to Django API and associate with carId
                      await uploadImages(selectedImages, carId);
                      selectedImages.clear();
                      cameraImages.clear();
                    } else {
                      print('You need to select exactly 7 images.');
                    }*/
                    setState(() {
                      imageUploaded = true;
                    });
                  }
                },
                child: ListTile(
                  leading: Icon(
                    Icons.image,
                  ),
                  title: Text(
                    "Gallery",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _getFromCamera();
                },
                child: ListTile(
                  leading: Icon(Icons.camera),
                  title: Text(
                    "Camera",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const MyProfileScreen()));
          },
        ),
        title: const Text(
          "Report a problem",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: const Color.fromRGBO(229, 228, 226, 30),
          child: Column(children: [
            Card(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, left: 15),
                    child: Text(
                      "What are you facing problem with?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: CheckboxListTile(
                      title: const Text(
                        'Lecture videos',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      value: _isChecked[0],
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked[0] = value ?? false;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: CheckboxListTile(
                      title: const Text(
                        'Mock test',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      value: _isChecked[1],
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked[1] = value ?? false;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: CheckboxListTile(
                      title: const Text(
                        'Question papers',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      value: _isChecked[2],
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked[2] = value ?? false;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: CheckboxListTile(
                      title: const Text(
                        'Doubts',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      value: _isChecked[3],
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked[3] = value ?? false;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: CheckboxListTile(
                      title: const Text(
                        'Others',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      value: _isChecked[4],
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked[4] = value ?? false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Please describe the problem you faced',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                onChanged: (value) {
                  // Handle the value change

                },
              ),
            ),
             SizedBox(
              height: 80,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      _openImageSheet();
                    },
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo_rounded),
                          Text(
                            imageUploaded ? " image Uploaded" : "  Upload image * Max 3 MB",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: imageUploaded ? () => _showSnackBar(context) : null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                child: const Text("Submit"),
              ),
            ),
             const SizedBox(
              height: 55,
            )
          ]),
        ),
      ),
    );
  }
}
