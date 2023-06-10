import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:crypt_ui/src/utils/aes256.dart';
import 'package:equatable/equatable.dart';

part 'crypt_file_event.dart';
part 'crypt_file_state.dart';

class CryptFileBloc extends Bloc<CryptFileEvent, CryptFileReady> {
  CryptFileBloc()
      : super(CryptFileReady(
            fileBytes: Uint8List(0), processedFileBytes: Uint8List(0))) {
    on<CryptFilePickedFile>(_onCryptFilePickedFile);
    on<CryptFileCryptButtonClicked>(_onCryptFileCryptButtonClicked);
    on<CryptFileDecryptButtonClicked>(_onCryptFileDeryptButtonClicked);
    on<CryptFileKeyChanged>(_onCryptFileKeyChanged);
  }
  void _onCryptFilePickedFile(
    CryptFilePickedFile event,
    Emitter<CryptFileReady> emit,
  ) async {
    print('_onCryptFilePickedFile');
    emit(state.copyWith(fileBytes: event.fileBytes, fileName: event.fileName));
  }

  void _onCryptFileKeyChanged(
    CryptFileKeyChanged event,
    Emitter<CryptFileReady> emit,
  ) async {
    emit(state.copyWith(key: event.key));
  }

  void _onCryptFileCryptButtonClicked(
    CryptFileCryptButtonClicked event,
    Emitter<CryptFileReady> emit,
  ) async {
    final result = await aes256Encrypt(state.key, state.fileBytes);
    print(result);
    emit(state.copyWith(
        processedFileBytes: Uint8List.fromList(result),
        time: DateTime.now().toString(),
        fileBytes: Uint8List.fromList(result)));
  }

  void _onCryptFileDeryptButtonClicked(
    CryptFileDecryptButtonClicked event,
    Emitter<CryptFileReady> emit,
  ) async {
    final result = await aes256Decrypt(state.key, state.fileBytes);
    print(result);
    emit(state.copyWith(
        processedFileBytes: Uint8List.fromList(result),
        time: DateTime.now().toString(),
        fileBytes: Uint8List.fromList(result)));
  }
}
