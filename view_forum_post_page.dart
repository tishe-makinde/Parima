import 'package:flutter/material.dart';

class ViewForumPostPage extends StatelessWidget {
  const ViewForumPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Title'),
            Text('Image'),
            Text('Ingredients'),
            Text('How to prepare'),
            Text('Comments'),
          ],
        ),
      ),
    );
  }
}
