import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parima/components/main_app_bar.dart';
import 'package:parima/components/user_input_box.dart';
import 'package:parima/mongodb/mongodb.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  var progress = 0.0;
  var errorText = '';
  var signInError = false;
  var loading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          signInError = false;
        });
      },
      child: Scaffold(
        appBar: const MainAppBar(title: 'Sign In'),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.warning),
                  title: Text(errorText),
                  selectedColor: Colors.red[400],
                  iconColor: Colors.transparent,
                  textColor: Colors.transparent,
                  selected: signInError,
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
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });

                    if (_emailController.text.isEmpty) {
                      setState(() {
                        errorText = 'No email provided';
                        signInError = true;
                        progress = 1.0;
                        loading = false;
                      });
                      return;
                    }

                    if (_passwordController.text.isEmpty) {
                      setState(() {
                        errorText = 'No password given';
                        signInError = true;
                        progress = 1.0;
                        loading = false;
                      });
                      return;
                    }

                    bool successful = await MongoDatabase.logIn(
                      _emailController.text,
                      _passwordController.text,
                    );

                    if (successful) {
                      // Successful log in
                      context.go('/home');
                      setState(() {
                        progress = 1.0;

                        loading = false;
                      });
                    } else {
                      setState(() {
                        errorText = 'Incorrect email or password';
                        signInError = true;
                        progress = 1.0;
                        loading = false;
                      });
                    }
                  },
                  style: loading
                      ? ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24,
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.surfaceBright,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      : ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 24,
                          ),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.75),
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                  child: loading
                      ? Text(
                          '...',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      : Text(
                          'Sign In',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account? '),
                    InkWell(
                      onTap: () {
                        context.go('/signup');
                      },
                      child: Text(
                        'Sign Up',
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
      ),
    );
  }
}
