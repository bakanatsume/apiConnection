import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pawfinder_app/model/user.dart';
import 'dart:convert';

import 'package:pawfinder_app/response/login_response.dart';

class LoginService {
  Future<LoginResponse> login(User loginRequest) async {
    try {
      return await http
          //esma timro ipconifg garera ip address rakha hai
          .post(Uri.parse('http://172.25.0.174:1001/admin/login'),
              headers: {
                'Content-Type': 'application/json',
                'accept': 'application/json',
              },
              body: json.encode(loginRequest.toJson()))
          .then((data) {
        if (data.statusCode == 200) {
          final response = LoginResponse.fromJson(jsonDecode(data.body));

          // sharedPreferences.setString('userImage', response.user.userImage);

          return response;
        } else {
          return LoginResponse(message: null, token: null);
        }
      }).catchError((e) {
        return LoginResponse(message: null, token: null);
      });
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e);
      return LoginResponse(message: null, token: null);
    } on HttpException {
      return LoginResponse(message: null, token: null);
    } on FormatException {
      return LoginResponse(message: null, token: null);
    }
  }
}
