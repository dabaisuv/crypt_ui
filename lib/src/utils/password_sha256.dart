import 'dart:convert';

import 'package:crypto/crypto.dart';

String passwordSha256(String password) {
  final hashedPassword = sha256.convert(utf8.encode(password)).toString();
  return hashedPassword;
}
