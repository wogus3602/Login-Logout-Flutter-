import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../user_repository.dart';
import 'authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }

//    if (event is AppStarted) {
//      final bool hasToken = await _userRepository.hasToken();
//
//      if (hasToken) {
//        yield* _mapAppStartedToState();
//      } else {
//        yield Unauthenticated();
//      }
//    }
//
//    if (event is LoggedIn) {
//      yield AuthenticationLoading();
//      await _userRepository.persistToken(event.token);
//      yield Authenticated();
//    }

//    if (event is LoggedOut) {
//      yield AuthenticationLoading();
//      await _userRepository.deleteToken();
//      yield Unauthenticated();
//    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool('islogin');
      //final isSignedIn = await _userRepository.isSignedIn();

      if (isLogin) {
        final name = await _userRepository.getUser();
        yield Authenticated(name);
      } else {

        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    final isSignedIn = await _userRepository.isSignedIn();
    if (isSignedIn) {
      yield Authenticated(await _userRepository.getUser());
    } else {
      yield Unauthenticated();
    }

  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setBool('islogin', false);
    yield Unauthenticated();
    _userRepository.signOut();
  }
}
