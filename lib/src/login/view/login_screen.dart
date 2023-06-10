import 'package:crypt_ui/src/background/background.dart';
import 'package:crypt_ui/src/login/login.dart';
import 'package:crypt_ui/src/repository/authentication_repository/authentication_repository.dart';
import 'package:crypt_ui/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static route(String path) =>
      GoRoute(path: path, builder: (context, state) => const LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
        actions: const [AppBarActionGoHomeScreen()],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Background(
        child: Center(
          child: BlocProvider(
            create: (context) => LoginBloc(
                authenticationRepository:
                    context.read<AuthenticationRepository>()),
            child: BlocListener<LoginBloc, LoginState>(
              listenWhen: (previous, current) =>
                  previous.submissionResult != current.submissionResult,
              listener: (context, state) {
                switch (state.submissionStatus) {
                  case SubmissionStatus.success:
                    showDialog(
                        context: context,
                        builder: (context) => const LoginOrRegisterAlertDialog(
                              contentText: '登录成功',
                              icon: Icons.access_alarm,
                            ));
                    break;
                  case SubmissionStatus.faliure:
                    showDialog(
                        context: context,
                        builder: (context) => LoginOrRegisterAlertDialog(
                              contentText: '登录失败：${state.submissionResult}',
                              icon: Icons.access_alarm,
                            ));
                    break;
                  default:
                }
              },
              child: const LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
