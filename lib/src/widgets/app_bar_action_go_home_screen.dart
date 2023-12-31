import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarActionGoHomeScreen extends StatelessWidget {
  const AppBarActionGoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.home),
      onPressed: () => context.go('/'),
    );
  }
}
