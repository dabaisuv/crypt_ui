import 'package:crypt_ui/src/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
      widthFactor: 0.78,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [EmailAddress(), Username(), Password(), RegisterButton()],
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
              .read<RegisterBloc>()
              .add(RegisterEmailAddressChanged(emailAddress: emailAddress)),
          decoration: const InputDecoration(labelText: "邮箱"),
          controller: TextEditingController()..text = 'adminaa@qq.com'),
    );
  }
}

class Username extends StatelessWidget {
  const Username({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          onChanged: (username) => context
              .read<RegisterBloc>()
              .add(RegisterUsernameChanged(username: username)),
          decoration: const InputDecoration(labelText: "用户名"),
          controller: TextEditingController()..text = 'adminaa'),
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
            .read<RegisterBloc>()
            .add(RegisterPasswordChanged(password: password)),
        decoration: const InputDecoration(labelText: "密码"),
        controller: TextEditingController()..text = 'adminaa',
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
        onPressed: () =>
            context.read<RegisterBloc>().add(RegisterButtonClicked()),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.add), Text('注册')],
            )),
      ),
    );
  }
}
