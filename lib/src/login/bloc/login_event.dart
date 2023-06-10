part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {}

final class LoginButtonClicked extends LoginEvent {
  @override
  List<Object?> get props => [];
}

final class LoginUsernameChanged extends LoginEvent {
  LoginUsernameChanged({required this.username});

  final String username;

  @override
  List<Object?> get props => [username];
}

final class LoginEmailAddressChanged extends LoginEvent {
  LoginEmailAddressChanged({required this.emailAddress});

  final String emailAddress;

  @override
  List<Object?> get props => [emailAddress];
}

final class LoginPasswordChanged extends LoginEvent {
  LoginPasswordChanged({required this.password});

  final String password;

  @override
  List<Object?> get props => [password];
}
