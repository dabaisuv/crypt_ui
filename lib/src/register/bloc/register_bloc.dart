import 'dart:developer';
import 'package:crypt_ui/src/utils/password_sha256.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:crypt_ui/src/repository/user_repository/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const RegisterState()) {
    on<RegisterButtonClicked>(_onRegisterButtonClicked);
    on<RegisterUsernameChanged>(_onUsernameChanged);
    on<RegisterEmailAddressChanged>(_onEmailAddressChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
  }
  final UserRepository _userRepository;

  Future<void> _onRegisterButtonClicked(
    RegisterButtonClicked event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      final hashedPassword = passwordSha256(state.password);
      final (isSuccess, result) = await _userRepository.register(
          username: state.username,
          emailAddress: state.emailAddress,
          password: hashedPassword);

      if (isSuccess) {
        log('register success: $result');
        emit(state.copyWith(
            submissionStatus: SubmissionStatus.success,
            submissionResult: '$result\n${DateTime.now()}'));
      } else {
        log('register failed: $result');
        emit(state.copyWith(
            submissionStatus: SubmissionStatus.faliure,
            submissionResult: '$result\n${DateTime.now()}'));
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(
          submissionStatus: SubmissionStatus.faliure,
          submissionResult: '连接错误\n${DateTime.now()}'));
    }
  }

  void _onUsernameChanged(
    RegisterUsernameChanged event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(username: event.username));
  }

  void _onEmailAddressChanged(
    RegisterEmailAddressChanged event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(emailAddress: event.emailAddress));
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }
}
