import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypt_ui/src/repository/authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState(
            authenticationStatus: AuthenticationStatus.unknown)) {
    on<_AuthenticationStateChanged>(_onAuthenticationStateChanged);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(_AuthenticationStateChanged(status)),
    );
  }
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;
  final AuthenticationRepository _authenticationRepository;

  void _onAuthenticationStateChanged(
    _AuthenticationStateChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(authenticationStatus: event.status));
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }
}
