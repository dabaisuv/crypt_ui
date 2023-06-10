import 'package:crypt_ui/src/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
      widthFactor: 0.78,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [EmailAddress(), Password(), LoginOrRegisterButton()],
      ),
    );
  }
}

class EmailAddress extends StatelessWidget {
  const EmailAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          onChanged: (emailAddress) => context
              .read<LoginBloc>()
              .add(LoginEmailAddressChanged(emailAddress: emailAddress)),
          decoration: const InputDecoration(labelText: "邮箱"),
          controller: TextEditingController()..text = 'adminaa@qq.com'),
    );
  }
}

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (password) => context
            .read<LoginBloc>()
            .add(LoginPasswordChanged(password: password)),
        decoration: const InputDecoration(labelText: "密码"),
        controller: TextEditingController()..text = 'adminaa',
      ),
    );
  }
}

class LoginOrRegisterButton extends StatelessWidget {
  const LoginOrRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => context.read<LoginBloc>().add(LoginButtonClicked()),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.login), Text('登录')],
            )),
      ),
    );
  }
}
