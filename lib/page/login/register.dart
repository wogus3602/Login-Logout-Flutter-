import 'package:flutter/material.dart';
import 'package:flutter_app/user_repository.dart';

import '../register_page.dart';


class Register extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Register',
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterPage();
          }),
        );
      },
    );
  }
}
