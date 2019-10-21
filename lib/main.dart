import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/page/home/home_page.dart';
import 'package:flutter_app/page/login/login_page.dart';
import 'package:flutter_app/splash/splash_page.dart';
import 'package:flutter_app/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication/authentication.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

//void main() {
//  BlocSupervisor.delegate = SimpleBlocDelegate();
//  final userRepository = UserRepository();
//  runApp(
//    BlocProvider<AuthenticationBloc>(
//      builder: (context) {
//        return AuthenticationBloc(userRepository: userRepository)
//          ..add(AppStarted());
//      },
//      child: App(userRepository: userRepository),
//    ),
//  );
//}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      builder: (context) =>
      AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatefulWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key:key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  UserRepository get _userRepository => widget.userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return HomePage();
          }
          if (state is Unauthenticated) {
            return LoginPage(userRepository: widget.userRepository);
          }

          return SplashPage();
        },
      ),
    );
  }
}

//
//class App extends StatelessWidget {
//  final UserRepository _userRepository;
//
//  App({Key key, @required UserRepository userRepository})
//      : assert(userRepository != null),
//        _userRepository = userRepository,
//        super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
//        builder: (context, state) {
//          if (state is Authenticated) {
//            return HomePage();
//          }
//          if (state is Unauthenticated) {
//            return LoginPage(userRepository: _userRepository);
//          }
//          return SplashPage();
//        },
//      ),
//    );
//  }
//}
