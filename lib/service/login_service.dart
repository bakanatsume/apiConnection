import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pawfinder_app/model/comment.dart';
import 'package:pawfinder_app/model/user.dart';
import 'package:pawfinder_app/response/comment_response.dart';
import 'dart:convert';

import 'package:pawfinder_app/response/login_response.dart';
import 'package:pawfinder_app/response/register_response.dart';

class LoginService {
  Future<LoginResponse> login(User loginRequest) async {
    try {
      return await http
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

class SignUpService {
  Future<RegisterResponse> signUp(User signUpRequest) async {
    try {
      return await http
          .post(Uri.parse('http://192.168.16.104:1001/user/register'),
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
          body: json.encode(signUpRequest.toJson()))
          .then((data) {
        if (data.statusCode == 200) {
          final response = RegisterResponse.fromJson(jsonDecode(data.body));

          // sharedPreferences.setString('userImage', response.user.userImage);

          return response;
        } else {
          return RegisterResponse(message: null);
        }
      }).catchError((e) {
        return RegisterResponse(message: null);
      });
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e);
      return RegisterResponse(message: null);
    } on HttpException {
      return RegisterResponse(message: null);
    } on FormatException {
      return RegisterResponse(message: null);
    }
  }
}

class CommentServiceWithToken {
  Future<CommentResponse> signUp(Comment commentRequest) async {
    try {
      var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjBiYjFmYTIxZWFjMzMwMDY0MzY1OGEiLCJpYXQiOjE2NDQ5MzQ0NTB9.VAyL5jun5AZRir3M9UcvXk-ziY9OK0Hvu-9VnAB2IkI";

      return await http
          .post(Uri.parse('http://192.168.16.104:1001/comment/insert'),
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
            'Authorization': "Bearer ${token.toString()}",
          },
          body: json.encode(commentRequest.toJson()))
          .then((data) {
        if (data.statusCode == 200) {
          final response = CommentResponse.fromJson(jsonDecode(data.body));

          // sharedPreferences.setString('userImage', response.user.userImage);

          return response;
        } else {
          return CommentResponse(msg: null);
        }
      }).catchError((e) {
        return CommentResponse(msg: null);
      });
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e);
      return CommentResponse(msg: null);
    } on HttpException {
      return CommentResponse(msg: null);
    } on FormatException {
      return CommentResponse(msg: null);
    }
  }
}
