import 'package:flutter/material.dart';
import 'package:flutter_app/authentication/authentication.dart';
import 'package:flutter_app/user_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.dart';

class LoginPage extends StatelessWidget {
  final UserRepository _userRepository;

  LoginPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: _userRepository,
          );
        },
        child: LoginForm(userRepository: _userRepository),
      ),
    );
  }
}
