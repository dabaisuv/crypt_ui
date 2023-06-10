part of 'authentication_bloc.dart';

final class AuthenticationState extends Equatable {
  const AuthenticationState({required this.authenticationStatus});

  final AuthenticationStatus authenticationStatus;

  AuthenticationState copyWith({AuthenticationStatus? authenticationStatus}) {
    return AuthenticationState(
        authenticationStatus:
            authenticationStatus ?? this.authenticationStatus);
  }

  @override
  List<Object> get props => [];
}
