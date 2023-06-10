part of 'crypt_file_bloc.dart';

abstract class CryptFileState extends Equatable {}

final class CryptFileReady extends Equatable {
  const CryptFileReady(
      {required this.fileBytes,
      required this.processedFileBytes,
      this.fileName = '',
      this.key = '',
      this.time = ''});

  final Uint8List fileBytes;
  final String fileName;
  final String key;
  final Uint8List processedFileBytes;
  final String time;

  CryptFileReady copyWith(
      {Uint8List? fileBytes,
      String? fileName,
      String? key,
      Uint8List? processedFileBytes,
      String? time}) {
    return CryptFileReady(
        fileBytes: fileBytes ?? this.fileBytes,
        fileName: fileName ?? this.fileName,
        key: key ?? this.key,
        processedFileBytes: processedFileBytes ?? this.processedFileBytes,
        time: time ?? this.time);
  }

  @override
  List<Object> get props =>
      [fileBytes, fileName, key, processedFileBytes, time];
}
