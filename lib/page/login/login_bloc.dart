import 'dart:async';
import 'package:flutter_app/authentication/authentication.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../../user_repository.dart';
import 'login.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required UserRepository userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await _userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        _userRepository.persistToken(token);
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
        if(token == null) yield LoginFailure();
      } catch (error) {
        yield LoginFailure();
      }
    }
  }

}
