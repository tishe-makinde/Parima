import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:parima/providers/user_provider.dart';
import 'package:popover/popover.dart';

class ProfilePicture extends ConsumerWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return IconButton(
      onPressed: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Profile'),
                onTap: () {
                  context.pop();
                  context.go('/edit_profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () {
                  context.pop();
                  context.go('/login');
                },
              ),
            ],
          ),
          width: 200,
          direction: PopoverDirection.bottom,
          backgroundColor: Theme.of(context).colorScheme.surface,
        );
      },
      icon: user.imageFile == null
          ? const CircleAvatar(
              backgroundImage: AssetImage('assets/images/therock.png'),
            )
          : CircleAvatar(
              backgroundImage: FileImage(user.imageFile!),
            ),
    );
  }
}
