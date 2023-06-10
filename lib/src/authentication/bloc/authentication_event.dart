part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class _AuthenticationStateChanged extends AuthenticationEvent {
  const _AuthenticationStateChanged(this.status);

  final AuthenticationStatus status;
}
