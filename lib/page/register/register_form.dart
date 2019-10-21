import 'package:flutter/material.dart';
import 'package:flutter_app/page/register/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
//  final UserRepository _userRepository;
//  LoginForm({Key key, @required UserRepository userRepository})
//      : assert(userRepository != null),
//        _userRepository = userRepository,
//        super(key: key);
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

bool isRegisterButtonEnabled(RegisterState state) {
  if(state is RegisterFailure){
    return false;
  }else if(state is RegisterLoading){
    return true;
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    _onSingUpButtonPressed() {
      BlocProvider.of<RegisterBloc>(context).add(
        RegisterButtonPressed(
          id: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
        ),
      );
    }
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Registration Failure'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is RegisterSuccess) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Scaffold(
              resizeToAvoidBottomPadding: false,
            body: Stack(
              children: <Widget>[
                 Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("회원가입", textScaleFactor: 3 ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        autocorrect: false,
                        autovalidate: true,
                        validator: (_) {
                          //eturn !state.isEmailValid ? 'Invalid Email' : null;
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 10),),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        autocorrect: false,
                        autovalidate: true,
                        validator: (_) {
                          //return !state.isPasswordValid ? 'Invalid Password' : null;
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 10),),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.account_box),
                          border: OutlineInputBorder(),
                          hintText: "Enter Name",
                          labelText: "Name",
                        ),
                      ),
                      RaisedButton(
                        onPressed:
                        state is! RegisterLoading
                            ? _onSingUpButtonPressed
                            : null,
                        child: Text('SignUp'),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

  }
}
