import 'package:flutter/material.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final void Function()? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      child: icon,
    );
  }
}
