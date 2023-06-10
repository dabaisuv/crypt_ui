import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required Widget child}) : _child = child;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 139, 159, 74).withOpacity(0.8),
            Color.fromARGB(255, 18, 26, 86).withOpacity(0.3)
          ],
        ),
      ),
      child: _child,
    );
  }
}
