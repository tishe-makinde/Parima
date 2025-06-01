import 'package:flutter/material.dart';

class CreateForumPostPage extends StatelessWidget {
  const CreateForumPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Title'),
            Text('Insert image'),
            Text('Ingredients'),
            Text('How to prepare'),
          ],
        ),
      ),
    );
  }
}
