import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  String? _token;

  String? get token => _token;

  Stream<AuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  Future<(bool, String)> logIn({
    required String emailAddress,
    required String password,
  }) async {
    var url = Uri.http('localhost:8080', 'api/login');
    var response = await http
        .post(url, body: {'emailAddress': emailAddress, 'password': password});
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      if (body['token'] != null) {
        _token = body['token'];
        _controller.add(AuthenticationStatus.authenticated);
        return (true, _token!);
      } else {
        final String error = body['error'];
        return (false, error);
      }
    }
    return (false, "");
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
