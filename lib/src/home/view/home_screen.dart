import 'package:crypt_ui/src/authentication/authentication.dart';
import 'package:crypt_ui/src/background/background.dart';
import 'package:crypt_ui/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static route(String path) =>
      GoRoute(path: path, builder: (context, state) => const HomeScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('主页'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Background(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [LoginButton(), RegisterButton()],
      )),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 171, 116, 6))),
        onPressed: () => context.go('/login'),
        child: const Text('登录'),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 110, 5, 54))),
          onPressed: () => context.go('/register'),
          child: const Text('注册')),
    );
  }
}
