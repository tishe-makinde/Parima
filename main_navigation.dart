// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parima/components/profile.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key, required this.child});

  final Widget child;

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Parima",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        elevation: 0.0,
        actions: const [
          ProfilePicture(),
        ],
      ),
      // drawer: MainDrawer(),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Stats',
            backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Forum',
            backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          ),
        ],
        onTap: (value) {
          switch (value) {
            case 0:
              context.go('/home');

            case 1:
              context.go('/stats');

            case 2:
              context.go('/forum');

            case 3:
              context.go('/settings');
          }

          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        useLegacyColorScheme: false,
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
