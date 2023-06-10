part of 'login_bloc.dart';

enum SubmissionStatus { initial, success, faliure }

final class LoginState extends Equatable {
  const LoginState(
      {this.username = '',
      this.password = '',
      this.emailAddress = '',
      this.submissionStatus = SubmissionStatus.initial,
      this.submissionResult = ''});

  final String username;
  final String password;
  final String emailAddress;
  final SubmissionStatus submissionStatus;
  final String submissionResult;

  LoginState copyWith(
      {String? username,
      String? password,
      String? emailAddress,
      SubmissionStatus? submissionStatus,
      String? submissionResult}) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        emailAddress: emailAddress ?? this.emailAddress,
        submissionStatus: submissionStatus ?? this.submissionStatus,
        submissionResult: submissionResult ?? this.submissionResult);
  }

  @override
  List<Object?> get props =>
      [username, password, submissionStatus, emailAddress, submissionResult];
}
