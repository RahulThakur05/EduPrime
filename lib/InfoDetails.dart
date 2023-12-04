import 'package:flutter/material.dart';

import 'Info.dart';

class editEmail extends StatefulWidget {
  const editEmail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _editEmail();
}

class _editEmail extends State<editEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_left,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Info()));
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Edit your Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Change your Email ID",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Previous ',
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
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    // Handle the value change
                    print('New value: $value');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text("Save"),
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

class Editname extends StatefulWidget {
  const Editname({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Editname();
}

class _Editname extends State<Editname> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_left,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Info()));
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Edit your name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "You can change the name once ,make sure it's correct",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Previous Name',
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
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    // Handle the value change
                    print('New value: $value');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text("Save"),
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

class editUsername extends StatefulWidget {
  const editUsername({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _editUsername();
}

class _editUsername extends State<editUsername> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_left,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Info()));
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Edit your Username",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Change your Username",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Previous ',
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
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    // Handle the value change
                    print('New value: $value');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text("Save"),
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

class Bio extends StatefulWidget {
  const Bio({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Bio();
}

class _Bio extends State<Bio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_left,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Info()));
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Edit your bio",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Your bio will be visible to anyone who visits your profile",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Add few words about yourself',
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
                    print('New value: $value');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text("Save"),
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
