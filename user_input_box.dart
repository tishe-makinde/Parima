import 'package:flutter/material.dart';

class UserInputBox extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;

  final bool sensitive;

  const UserInputBox({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.sensitive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: sensitive,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon),
          prefixIconColor: Theme.of(context).colorScheme.primary,
          labelText: label,
          labelStyle: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
