part of 'crypt_file_bloc.dart';

sealed class CryptFileEvent extends Equatable {
  const CryptFileEvent();

  @override
  List<Object> get props => [];
}

final class CryptFilePickedFile extends CryptFileEvent {
  const CryptFilePickedFile({required this.fileBytes, required this.fileName});

  final Uint8List fileBytes;
  final String fileName;

  @override
  List<Object> get props => [fileBytes, fileName];
}

final class CryptFileKeyChanged extends CryptFileEvent {
  const CryptFileKeyChanged({required this.key});

  final String key;
}

final class CryptFileCryptButtonClicked extends CryptFileEvent {
  const CryptFileCryptButtonClicked();
}

final class CryptFileDecryptButtonClicked extends CryptFileEvent {
  const CryptFileDecryptButtonClicked();
}
