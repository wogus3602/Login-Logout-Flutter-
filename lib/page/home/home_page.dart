import 'package:flutter/material.dart';
import 'package:flutter_app/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Center(
                    child: RaisedButton(
                  child: Text('logout'),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                  },
                ),
                ),
              ),
              Text(state.props[0]),
              Text("자동로그인이 되어있습니다."),
            ],
          );
        }
      ),
    );
  }
}
