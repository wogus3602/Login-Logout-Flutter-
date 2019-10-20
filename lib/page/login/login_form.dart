import 'package:flutter/material.dart';
import 'package:flutter_app/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register.dart';
import 'login.dart';

class LoginForm extends StatefulWidget {
//  final UserRepository _userRepository;
//  LoginForm({Key key, @required UserRepository userRepository})
//      : assert(userRepository != null),
//        _userRepository = userRepository,
//        super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  //UserRepository get _userRepository => widget._userRepository;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('로그인 실패'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.white,
                ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: <Widget>[
                   Expanded(
                     child :
                    Image.asset("image/image.gif"),
                   ),
                   Stack(
                     children: <Widget>[
                       Padding(
                         padding: EdgeInsets.all(size.width*0.05),
                         child: Card(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(16)
                           ),
                           elevation: 6,
                           child: Padding(
                             padding: const EdgeInsets.only(left:12.0, right: 12, top:12),
                             child: Form(
                               child: Column(
                                 children: <Widget>[
                                   TextFormField(
                                     decoration: InputDecoration(
                                       icon: Icon(Icons.email),
                                       labelText: 'Email',
                                     ),
                                     controller: _usernameController,
                                   ),
                                   TextFormField(
                                     decoration: InputDecoration(
                                       icon: Icon(Icons.lock),
                                       labelText: 'Password',
                                     ),
                                     controller: _passwordController,
                                     obscureText: true,
                                   ),
                                   Row(

                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: <Widget>[
                                       Padding(padding: EdgeInsets.only(top: 100)),
                                       RaisedButton(
                                         onPressed: state is! LoginLoading
                                             ? _onLoginButtonPressed
                                             : null,
                                         child: Text('Login'),
                                       ),
                                       Padding(padding: EdgeInsets.only(right: 30)),
                                       Register(),
                                     ],
                                   ),

                                   Container(
                                     child: state is LoginLoading
                                         ? CircularProgressIndicator()
                                         : null,
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
                 ],
               )
              ],
            ),
          );
        },
      ),
    );
  }
}
