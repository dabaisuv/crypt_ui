part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {}

final class RegisterButtonClicked extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

final class RegisterUsernameChanged extends RegisterEvent {
  RegisterUsernameChanged({required this.username});

  final String username;

  @override
  List<Object?> get props => [username];
}

final class RegisterEmailAddressChanged extends RegisterEvent {
  RegisterEmailAddressChanged({required this.emailAddress});

  final String emailAddress;

  @override
  List<Object?> get props => [emailAddress];
}

final class RegisterPasswordChanged extends RegisterEvent {
  RegisterPasswordChanged({required this.password});

  final String password;

  @override
  List<Object?> get props => [password];
}
