import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'models/user_model.dart';

class UserRepository {

  static const String _url = "http://220.79.163.186:8080/v1/signin";

  final String _Token =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ3b2d1czM2MDJAbmF2ZXIuY29tIiwicm9sZXMiOlsiUk9MRV9VU0VSIl0sImlhdCI6MTU3MTU0NDcwOSwiZXhwIjoxNTcxNTQ4MzA5fQ.-G7QgwvxKMQ2JXvOJ6jcxjcFZEf_XKds4FU1QZAg8Sw";

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    final response = await http
        .post(_url, body: {'id': username, 'password': password});
        var dejson = json.decode(response.body);
    return dejson['data'];
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

}
