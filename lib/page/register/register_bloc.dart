import 'dart:async';
import 'package:flutter_app/authentication/authentication.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../../user_repository.dart';
import 'register.dart';
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();

      try {
        final success = await _userRepository.signUp(
          id: event.id,
          password: event.password,
          name: event.name,
        );
        yield RegisterInitial();
        if(success) yield RegisterSuccess();
        else yield RegisterFailure();
      } catch (error) {
        yield RegisterFailure();
      }
    }
  }

}
