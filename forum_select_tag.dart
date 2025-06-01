import 'package:flutter/material.dart';

class ForumSelectTag extends StatelessWidget {
  const ForumSelectTag({
    super.key,
    required this.title,
    IconData? iconData,
  }) : _iconData = iconData;

  final IconData? _iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: _iconData == null ? null : Icon(_iconData),
      label: Text(title),
      labelStyle: Theme.of(context).textTheme.titleSmall,
      side: BorderSide.none,
      backgroundColor: Theme.of(context).colorScheme.surfaceBright,
    );
  }
}
