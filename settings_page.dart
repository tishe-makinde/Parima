import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Account',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceBright,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _buildOption(
                        context,
                        Icons.email,
                        'Change Email',
                        () {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildOption(
                        context,
                        Icons.lock,
                        'Change Password',
                        () {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildOption(
                        context,
                        Icons.logout,
                        'Sign Out',
                        () {
                          context.go('/login');
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildOption(
                        context,
                        Icons.delete_forever,
                        'Delete Account',
                        () {},
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Row(
              //   children: [
              //     Text(
              //       'Appearance',
              //       style: Theme.of(context).textTheme.titleSmall,
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).colorScheme.surfaceBright,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       children: [
              //         _buildOption(
              //           context,
              //           Icons.format_paint,
              //           'Theme',
              //           () {},
              //         ),
              //         const SizedBox(
              //           height: 15,
              //         ),
              //         _buildOption(
              //           context,
              //           Icons.zoom_in,
              //           'Zoom Level',
              //           () {},
              //         ),
              //         const SizedBox(
              //           height: 15,
              //         ),
              //         _buildOption(
              //           context,
              //           Icons.text_increase,
              //           'Font Size',
              //           () {},
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, IconData icon, String title,
      void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
