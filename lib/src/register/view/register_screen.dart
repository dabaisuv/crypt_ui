import 'package:crypt_ui/src/background/background.dart';
import 'package:crypt_ui/src/register/register.dart';
import 'package:crypt_ui/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:crypt_ui/src/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static route(String path) => GoRoute(
        path: path,
        builder: (context, state) => const RegisterScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("注册"),
        actions: const [AppBarActionGoHomeScreen()],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Background(
        child: Center(
          child: BlocProvider(
            create: (context) =>
                RegisterBloc(userRepository: context.read<UserRepository>()),
            child: BlocListener<RegisterBloc, RegisterState>(
              listenWhen: (previous, current) =>
                  previous.submissionResult != current.submissionResult,
              listener: (context, state) {
                switch (state.submissionStatus) {
                  case SubmissionStatus.success:
                    showDialog(
                        context: context,
                        builder: ((context) => const LoginOrRegisterAlertDialog(
                              contentText: '注册成功',
                              icon: Icons.fork_right,
                            )));
                    break;
                  case SubmissionStatus.faliure:
                    showDialog(
                        context: context,
                        builder: ((context) => LoginOrRegisterAlertDialog(
                              contentText: '注册失败：${state.submissionResult}',
                              icon: Icons.fork_right,
                            )));
                    break;

                  default:
                }
              },
              child: const RegisterForm(),
            ),
          ),
        ),
      ),
    );
  }
}
