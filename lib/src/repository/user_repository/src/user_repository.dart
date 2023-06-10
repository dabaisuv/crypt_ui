import 'dart:convert';

import 'package:http/http.dart' as http;

class UserRepository {
  Future<(bool, String)> register(
      {required String username,
      required String emailAddress,
      required String password}) async {
    final uri = Uri.http('localhost:8080', 'api/register');
    final response = await http.post(uri, body: {
      'username': username,
      'emailAddress': emailAddress,
      'password': password
    });
    final bool isSuccess;
    final String result;

    final body = json.decode(response.body);

    if (response.statusCode == 200) {
      if (body['message'] != null) {
        isSuccess = true;
        result = body['message'];
      } else {
        isSuccess = false;
        result = body['error'];
      }
    } else {
      isSuccess = false;
      result = 'connect error.';
    }

    return (isSuccess, result);
  }
}
