import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {

  static const String root = "http://220.79.163.186:8080/v1";
  static const String SIGNIN_URL = root + "/signin";
  static const String SIGNUP_URL  = root + "/signup";
  static const String USER_URL  = root + "/user?lang=ko";
  final String _Token =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ3b2d1czM2MDJAbmF2ZXIuY29tIiwicm9sZXMiOlsiUk9MRV9VU0VSIl0sImlhdCI6MTU3MTU0NDcwOSwiZXhwIjoxNTcxNTQ4MzA5fQ.-G7QgwvxKMQ2JXvOJ6jcxjcFZEf_XKds4FU1QZAg8Sw";
  var dejson;
  SharedPreferences prefs;


  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    final response = await http
        .post(SIGNIN_URL, body: {'id': username, 'password': password});
        dejson = json.decode(response.body);
    prefs= await SharedPreferences.getInstance();
    prefs.setBool('islogin', dejson['success']);
    return dejson['data'];
  }

  Future<bool> signUp({
    @required String id,
    @required String password,
    @required String name,
  }) async {
    final response = await http
        .post(SIGNUP_URL, body: {'id': id, 'password': password ,'name':name});
    dejson = json.decode(response.body);

    return dejson['success'];
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    prefs= await SharedPreferences.getInstance();
    prefs.setString('token', token);
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future<bool> hasToken() async {
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if(token == null) return false;
    else return true;
  }

  Future<bool> isSignedIn() async {
    return dejson['success'];
  }


  Future<void> signOut() async {
    return false;
  }
  Future<String> getUser() async {
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final response = await http
        .get(USER_URL, headers: {"X-AUTH-TOKEN" : token});
    dejson = json.decode(response.body);
    var list = dejson['data'];
    return list['uid'];
  }
}
