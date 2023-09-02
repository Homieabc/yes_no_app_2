import 'package:flutter/material.dart';

class AppBarButtons extends StatelessWidget {
  VoidCallback? onPressed;
  final IconData icon;

  AppBarButtons({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 25,
      ),
      onPressed: onPressed,
    );
  }
}
