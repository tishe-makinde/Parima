import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:parima/components/main_navigation.dart';
import 'package:parima/pages/auth/login_page.dart';
import 'package:parima/pages/auth/sign_up_page.dart';
import 'package:parima/pages/edit_profile_page.dart';
import 'package:parima/pages/forum/create_forum_post_page.dart';
import 'package:parima/pages/forum/forums_page.dart';
import 'package:parima/pages/home_page.dart';
import 'package:parima/pages/settings_page.dart';
import 'package:parima/pages/stats_page.dart';
import 'package:parima/themes/dark_theme.dart';
import 'package:parima/themes/light_theme.dart';
import "package:parima/pages/auth/legitimate_user.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OpenFoodAPIConfiguration.userAgent = UserAgent(name: 'Parima');

  OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
    OpenFoodFactsLanguage.ENGLISH
  ];

  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.UNITED_KINGDOM;

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Parima',
      routerConfig: _router,
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) => const LegitimateUser(userStatus: false),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    ShellRoute(
      builder: (context, state, child) => MainNavigation(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/stats',
          builder: (context, state) => StatsPage(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          name: '/forum',
          path: '/forum',
          builder: (context, state) => ForumsPage(),
        ),
        GoRoute(
          path: '/create_forum_post',
          builder: (context, state) => const CreateForumPostPage(),
        ),
        GoRoute(
          path: '/edit_profile',
          builder: (context, state) => EditProfilePage(),
        ),
      ],
    )
  ],
);
