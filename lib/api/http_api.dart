import 'package:webapp/index.dart';
import 'package:webapp/responses/responseIndex.dart';

import 'dart:convert';
import '../responses/login.dart';

import 'package:http/http.dart' as http;
import 'dart:html' show window;

/* class HttpApi extends Api {
  static HttpApi api;
  static const baseUrl = "FIXME";

  Map<String, String> myHeaders = Map<String, String>();
  // FIXME apiHeaders ['header1'] = 'header1';

  @override
  Future<void> signUp(String email, String password, String firstName, String lastName;) async {
    Map<String, String> data = {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
    };

    final response = await http.post(baseUrl, data, headers: apiHeaders);
    if (response.statusCode == 200) {
      return CreateUserResponse.fromJson(jsonDecode(response.body)); //FIXME
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  @override
  Future<void> logIn(Map user) async {
    Map<String, String> data = {
      "email": email,
      "password": password,
    };

    final response = await http.post(baseUrl, data, headers: apiHeaders);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  @override
  Future<void> getStudents() async {
    
  }
}
 */
class Apis {
  final url = URL;

  static Future<dynamic> getCourses() async {
    String resString = "";

    var request = http.Request('POST', Uri.parse(URL));
    var headers = {'Content-Type': 'application/json'};

    request.body =
        '''{"query":"query{\\r\\n  allCourses\\r\\n  {\\r\\n    courseTitle,\\r\\n    courseTutor,\\r\\n    courseInfo,\\r\\n    instructionLanguage,\\r\\n    amountOfSeatsLeft,\\r\\n    amountOfSeats,\\r\\n    students{\\r\\n      user{\\r\\n        firstName\\r\\n      }\\r\\n    }\\r\\n  }\\r\\n}","variables":{}}''';
    request.headers.addAll(headers);

    http.StreamedResponse res = await request.send();

    if (res.statusCode == 200) {
      resString = await res.stream.bytesToString();
      print(resString);

      if (resString.contains("error")) {
        print("Failed Course Fetch");
        return false;
      } else {
        /* FIXME window.sessionStorage['all_courses'] =
            LoginResponse.fromJson(jsonDecode(resString)).data; */
        return  LoginResponse.fromJson(jsonDecode(resString));
      }
    } else {
      print("Failed While fetching Data");
      print(res.reasonPhrase);
      return null;
    }
  }
}
