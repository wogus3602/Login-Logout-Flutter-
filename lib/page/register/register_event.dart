import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final String id;
  final String password;
  final String name;

  const RegisterButtonPressed({
    @required this.id,
    @required this.password,
    @required this.name,
  });

  @override
  List<Object> get props => [id, password,name];

  @override
  String toString() =>
      'SignUpButtonPressed { id: $id, password: $password,name: $name  }';
}
