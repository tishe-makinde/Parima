import 'dart:io';

class User {
  String email;
  String username;

  String firstName;
  String lastName;

  double? weight;
  double? height;

  File? imageFile;

  String? bio;
  String? links;
  String? dietaryRequirements;

  User({
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.weight,
    this.height,
    this.imageFile,
    this.bio,
    this.links,
    this.dietaryRequirements,
  });
}
