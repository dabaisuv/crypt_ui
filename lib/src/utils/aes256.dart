import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart';

Future<List<int>> aes256Encrypt(String key, List<int> data) async {
  final keyList = List<int>.from(utf8.encode(key));
  keyList.length < 32
      ? keyList.addAll(List.filled(32 - keyList.length, 0))
      : null;
  final secretKey = SecretKey(keyList.sublist(0, 32));

  final iv = List<int>.generate(
      16, (i) => Random.secure().nextInt(256)); //随机生成一个16byte的初始化向量
  final algorithm = AesGcm.with256bits(); //选择256位AES加密算法
  final encrypted =
      await algorithm.encrypt(data, secretKey: secretKey, nonce: iv); //加密数据
  final mac = encrypted.mac.bytes;
  final encryptedBytes = [...iv, ...mac, ...encrypted.cipherText]; //生成加密后的字节数组
  return encryptedBytes;
}

Future<List<int>> aes256Decrypt(String key, List<int> encryptedData) async {
  final keyList = List<int>.from(utf8.encode(key));
  keyList.length < 32
      ? keyList.addAll(List.filled(32 - keyList.length, 0))
      : null;
  final secretKey = SecretKey(keyList.sublist(0, 32));
  final algorithm = AesGcm.with256bits(); // 选择256位AES解密算法
  final iv = encryptedData.sublist(0, 16); // 获取初始化向量
  final mac = encryptedData.sublist(16, 32);
  final cipherText = encryptedData.sublist(32); // 获取需要解密的密文
  final encrypted = SecretBox(cipherText,
      nonce: iv, mac: Mac(mac)); // 将需要解密的数据和初始化向量生成 Encrypted 类实例
  final decrypted =
      await algorithm.decrypt(encrypted, secretKey: secretKey); // 解密密文
  return decrypted; // 返回解密后的数据
}
