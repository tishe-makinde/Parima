import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parima/components/main_floating_action_button.dart';
import 'package:parima/providers/user_provider.dart';

class EditProfilePage extends ConsumerWidget {
  EditProfilePage({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final bioController = TextEditingController();
  final linksController = TextEditingController();
  final dietaryController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    bioController.text = user.bio ?? '';
    linksController.text = user.links ?? '';
    dietaryController.text = user.dietaryRequirements ?? '';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);

                    if (image == null) return;

                    ref
                        .watch(userProvider.notifier)
                        .updateFirstName(firstNameController.text);
                    ref
                        .watch(userProvider.notifier)
                        .updateLastName(lastNameController.text);
                    ref
                        .watch(userProvider.notifier)
                        .updateBio(bioController.text);
                    ref
                        .watch(userProvider.notifier)
                        .updateLinks(linksController.text);
                    ref
                        .watch(userProvider.notifier)
                        .updateDietaryRequirements(dietaryController.text);

                    ref
                        .watch(userProvider.notifier)
                        .updateImageFile(File(image.path));
                  },
                  child: user.imageFile == null
                      ? const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/therock.png'),
                          radius: 50,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(user.imageFile!),
                          radius: 50,
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        controller: firstNameController,
                        decoration: const InputDecoration(
                          label: Text('First Name'),
                          border: InputBorder.none,
                        ),
                      ),
                      TextField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          label: Text('Last Name'),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(
                label: Text('Bio'),
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: linksController,
              decoration: const InputDecoration(
                label: Text('Links'),
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: dietaryController,
              decoration: const InputDecoration(
                label: Text('Dietary Requirements'),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MainFloatingActionButton(
        onPressed: () {
          final bool success = _submit();

          if (success) {
            ref
                .watch(userProvider.notifier)
                .updateFirstName(firstNameController.text);
            ref
                .watch(userProvider.notifier)
                .updateLastName(lastNameController.text);
            ref.watch(userProvider.notifier).updateBio(bioController.text);
            ref.watch(userProvider.notifier).updateLinks(linksController.text);
            ref
                .watch(userProvider.notifier)
                .updateDietaryRequirements(dietaryController.text);
            context.go('/home');
          }
        },
        icon: const Icon(Icons.check),
      ),
    );
  }

  bool _submit() {
    return true;
  }
}
