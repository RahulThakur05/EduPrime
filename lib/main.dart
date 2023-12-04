import 'package:flutter/material.dart';
import 'package:projectui/Setting.dart';
import 'package:projectui/login.dart';
import 'package:projectui/navbar.dart';
import 'package:projectui/search.dart';
import 'package:projectui/tryprofile.dart';
import 'package:projectui/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';


String globalapi="http://192.168.156.20:8000";
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(), // Create an instance of the UserProvider
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; // Initially, set to false for light mode.

  @override
  void initState() {
    super.initState();
    _loadDarkModePreference();
  }

  // Load the user's dark mode preference from SharedPreferences.
  _loadDarkModePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  // Toggle the theme mode and save the preference to SharedPreferences.
  void _toggleDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = !isDarkMode;
      prefs.setBool('darkMode', isDarkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, device){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(), // Define a dark theme
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Use dynamic theme based on user preference
      home: MyLogin(),
    );
    });
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
