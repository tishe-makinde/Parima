import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parima/components/main_app_bar.dart';
import 'package:parima/components/user_input_box.dart';
import 'package:parima/mongodb/mongodb.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Sign Up'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              UserInputBox(
                controller: _firstNameController,
                label: 'First Name',
                icon: Icons.account_circle,
              ),
              const SizedBox(
                height: 15,
              ),
              UserInputBox(
                controller: _lastNameController,
                label: 'Last Name',
                icon: Icons.account_circle,
              ),
              const SizedBox(
                height: 15,
              ),
              UserInputBox(
                controller: _usernameController,
                label: 'Username',
                icon: Icons.account_circle,
              ),
              const SizedBox(
                height: 15,
              ),
              UserInputBox(
                controller: _emailController,
                label: 'Email',
                icon: Icons.email,
              ),
              const SizedBox(
                height: 15,
              ),
              UserInputBox(
                controller: _passwordController,
                label: 'Password',
                icon: Icons.password,
                sensitive: true,
              ),
              const SizedBox(
                height: 15,
              ),
              UserInputBox(
                controller: _confirmPasswordController,
                label: 'Confirm Password',
                icon: Icons.password,
                sensitive: true,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  await MongoDatabase.signUp(
                      _usernameController.text,
                      _firstNameController.text,
                      _lastNameController.text,
                      _emailController.text,
                      _passwordController.text);

                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  fixedSize: Size(MediaQuery.of(context).size.width, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  InkWell(
                    onTap: () {
                      context.go('/login');
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
