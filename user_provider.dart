import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parima/models/user.dart';

class UserProvider extends StateNotifier<User> {
  UserProvider()
      : super(
          User(
            email: 'therock@email.com',
            username: 'therock',
            firstName: 'Dwayne',
            lastName: 'Johnson',
          ),
        );

  void updateFirstName(String firstName) {
    state = User(
      email: state.email,
      username: state.username,
      firstName: firstName,
      lastName: state.lastName,
      imageFile: state.imageFile,
      bio: state.bio,
      links: state.links,
      dietaryRequirements: state.dietaryRequirements,
    );
  }

  void updateLastName(String lastName) {
    state = User(
      email: state.email,
      username: state.username,
      firstName: state.firstName,
      lastName: lastName,
      imageFile: state.imageFile,
      bio: state.bio,
      links: state.links,
      dietaryRequirements: state.dietaryRequirements,
    );
  }

  void updateImageFile(File file) {
    state = User(
      email: state.email,
      username: state.username,
      firstName: state.firstName,
      lastName: state.lastName,
      imageFile: file,
      bio: state.bio,
      links: state.links,
      dietaryRequirements: state.dietaryRequirements,
    );
  }

  void updateBio(String bio) {
    state = User(
      email: state.email,
      username: state.username,
      firstName: state.firstName,
      lastName: state.lastName,
      imageFile: state.imageFile,
      bio: bio,
      links: state.links,
      dietaryRequirements: state.dietaryRequirements,
    );
  }

  void updateLinks(String links) {
    state = User(
      email: state.email,
      username: state.username,
      firstName: state.firstName,
      lastName: state.lastName,
      imageFile: state.imageFile,
      bio: state.bio,
      links: links,
      dietaryRequirements: state.dietaryRequirements,
    );
  }

  void updateDietaryRequirements(String dietaryRequirements) {
    state = User(
      email: state.email,
      username: state.username,
      firstName: state.firstName,
      lastName: state.lastName,
      imageFile: state.imageFile,
      bio: state.bio,
      links: state.links,
      dietaryRequirements: dietaryRequirements,
    );
  }
}

final userProvider = StateNotifierProvider<UserProvider, User>(
  (ref) => UserProvider(),
);
