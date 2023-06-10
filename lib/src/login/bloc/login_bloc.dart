import 'package:bloc/bloc.dart';
import 'package:crypt_ui/src/utils/password_sha256.dart';
import 'package:equatable/equatable.dart';

import 'package:crypt_ui/src/repository/authentication_repository/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginButtonClicked>(_onLoginButtonClicked);
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginEmailAddressChanged>(_onEmailAddressChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onLoginButtonClicked(
    LoginButtonClicked event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final hashedPassword = passwordSha256(state.password);

      final (isSuccess, result) = await _authenticationRepository.logIn(
          emailAddress: state.emailAddress, password: hashedPassword);
      if (isSuccess) {
        emit(state.copyWith(
            submissionStatus: SubmissionStatus.success,
            submissionResult: '$result\n${DateTime.now()}'));
      } else {
        emit(state.copyWith(
            submissionStatus: SubmissionStatus.faliure,
            submissionResult: '$result\n${DateTime.now()}'));
      }
    } catch (_) {
      emit(state.copyWith(
          submissionStatus: SubmissionStatus.faliure,
          submissionResult: '连接错误\n${DateTime.now()}'));
    }
  }

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(username: event.username));
  }

  void _onEmailAddressChanged(
    LoginEmailAddressChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(emailAddress: event.emailAddress));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }
}
