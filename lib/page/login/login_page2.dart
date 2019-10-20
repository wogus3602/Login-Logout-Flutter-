//import 'package:flutter/material.dart';
//import 'package:flutter_app/blocs/val_bloc.dart';
//import 'package:flutter_app/blocs/user_email_password.dart';
//import 'package:flutter_app/page/register_page.dart';
//import 'package:flutter_app/page/val_page.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//import 'login_bloc.dart';
//
//class LoginForm extends StatefulWidget {
//  @override
//  State<LoginForm> createState() => _LoginFormState();
//}
//
//class _LoginFormState extends State<LoginForm> {
//  final TextEditingController _emailController = TextEditingController();
//  final TextEditingController _passwordController = TextEditingController();
//
//  changeThePage(BuildContext context) {
//    final userInfoBloc = UserInfoBloc();
//    userInfoBloc.sendInfo(_emailController.text, _passwordController.text);
//
//    Navigator.of(context)
//        .push(MaterialPageRoute(builder: (context) => ValPage()));
//  }
////  void _onFormSubmitted() {
////    _loginBloc.add(
////      LoginWithCredentialsPressed(
////        email: _emailController.text,
////        password: _passwordController.text,
////      ),
////    );
////  }
//  final bloc = Bloc();
//  @override
//  Widget build(BuildContext context) {
//    _onLoginButtonPressed() {
//      BlocProvider.of<LoginBloc>(context).add(
//        LoginButtonPressed(
//          username: _usernameController.text,
//          password: _passwordController.text,
//        ),
//      );
//    }
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Login Page'),
//      ),
//      body: Container(
//          //height: MediaQuery.of(context).size.height,
//          //padding: EdgeInsets.all(16),
//          child: Column(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              StreamBuilder<String>(
//                stream: bloc.email,
//                builder: (context, snapshot) => TextField(
//                  onChanged: bloc.emailChanged,
//                  controller: _emailController,
//                  keyboardType: TextInputType.emailAddress,
//                  decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      hintText: "Enter email",
//                      labelText: "Email",
//                      errorText: snapshot.error),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              StreamBuilder<String>(
//                stream: bloc.password,
//                builder: (context, snapshot) => TextField(
//                  onChanged: bloc.passwordChanged,
//                  controller: _passwordController,
//                  keyboardType: TextInputType.text,
//                  obscureText: true,
//                  decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      hintText: "Enter password",
//                      labelText: "Password",
//                      errorText: snapshot.error),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  StreamBuilder<bool>(
//                    stream: bloc.submitCheck,
//                    builder: (context, snapshot) =>
//                        RaisedButton(
//                          onPressed: snapshot.hasData
//                              ? () => changeThePage(context)
//                              : null,
//                        ),
//                  ),
//                  RaisedButton(
//                 child: Text("회원가입"),
//                  onPressed: (){
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context)=>
//                          RegisterPage()),
//                    );
//                },
//              )],
//              )
//            ],
//          ),
//        ),
//    );
//  }
//
//}