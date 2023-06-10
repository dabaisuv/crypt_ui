import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginOrRegisterAlertDialog extends StatelessWidget {
  final String contentText;
  final IconData icon;

  const LoginOrRegisterAlertDialog(
      {super.key, required this.contentText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 40.0,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Text(
              contentText,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: const Text(
              '返回首页',
              style: TextStyle(fontSize: 18.0),
            ),
            onPressed: () => context.go('/'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: const Text(
              '关闭',
              style: TextStyle(fontSize: 18.0),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
