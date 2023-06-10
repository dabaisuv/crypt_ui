import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {required this.username,
      required this.emailAddress,
      required this.token});

  final String username;
  final String emailAddress;
  final String token;

  @override
  List<Object> get props => [username, emailAddress, token];

  static const empty = User(emailAddress: '', username: '', token: '');
}
