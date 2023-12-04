import 'dart:convert';
import 'package:http/http.dart' as http;

import 'main.dart';


class DQuestion {
 // String baseUrl = '$globalapi/Questions/';
 //  String baseUrl = '$globalapi/Questions/';
  String baseUrl = '$globalapi/Questions/';
  Future<dynamic> postAllQuestion() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        try {
          return jsonDecode(response.body);
        } catch (_) {
          return response.body;
        }
      } else {
        throw Exception('Server Error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

class Option {
 /* final String baseUrl =
      '$globalapi/question/<question_id>/options/';
*/
  String baseUrl = '$globalapi/question/<question_id>/options/';
  Future<dynamic> getOptions(int questionId) async {
    try {
      var url =
          Uri.parse(baseUrl.replaceAll('<question_id>', questionId.toString()));
      var response = await http.get(url);
      if (response.statusCode == 200) {
        try {
          return jsonDecode(response.body);
        } catch (_) {
          return response.body;
        }
      } else {
        throw Exception('Server Error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

class UserData {
 // String baseUrl = '$globalapi/view_user_data/';
  String baseUrl = '$globalapi/view_user_data/';

  Future<dynamic> postAllUserData() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        try {
          return jsonDecode(response.body);
        } catch (_) {
          return response.body; // Return plain text response if not JSON
        }
      } else {
        throw Exception('Server Error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

class HomePhoto {
  String baseUrl = '$globalapi/HomePhoto';
 // String baseUrl = '$globalapi/HomePhoto';

  Future<dynamic> postAllHomePhoto() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        try {
          return jsonDecode(response.body);
        } catch (_) {
          return response.body; // Return plain text response if not JSON
        }
      } else {
        throw Exception('Server Error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

class SubPhoto {
  String baseUrl = '$globalapi/SubPhoto';

  Future<dynamic> postAllSubPhoto() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        try {
          return jsonDecode(response.body);
        } catch (_) {
          return response.body; // Return plain text response if not JSON
        }
      } else {
        throw Exception('Server Error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

class LectureService {
  static  String _baseUrl = '$globalapi';

  Future<List<dynamic>> searchLectures(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/VideoLecture/?search=$query'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load lectures');
    }
  }
}




