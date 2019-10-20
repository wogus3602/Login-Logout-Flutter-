//import 'dart:async';
//import 'dart:convert';
//import 'dart:io';
//import 'package:flutter_app/blocs/todo.dart';
//import 'package:flutter_app/models/user_model.dart';
//import 'package:http/http.dart' as http;
//
//class API {
//  static const String _url = "http://220.79.163.186:8080/v1/signin";
//
//  final String _Token =
//      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ3b2d1czM2MDJAbmF2ZXIuY29tIiwicm9sZXMiOlsiUk9MRV9VU0VSIl0sImlhdCI6MTU3MTU0NDcwOSwiZXhwIjoxNTcxNTQ4MzA5fQ.-G7QgwvxKMQ2JXvOJ6jcxjcFZEf_XKds4FU1QZAg8Sw";
//
//  Future<Todo> getTodo() async {
//    final response = await http.get(
//      _url,
//      headers: {"X-AUTH-TOKEN": _Token},
//    );
//    final responseJson = json.decode(response.body);
//    return Todo.fromJson(responseJson);
//  }
//
//  Future<UserModel> getUser(String id, String password) async {
//
//    print(password);
//    final request = await http
//        .post(_url, body: {'id': id, 'password': password});
//    print(request.request.toString());
//    print(request.body.toString());
//    return UserModel.fromJson(json.decode(request.body));
//  }
//}
