import 'package:flutter/material.dart';
import 'package:parima/components/main_navigation.dart';
import 'package:parima/pages/auth/login_page.dart';
import 'package:parima/pages/home_page.dart';

class LegitimateUser extends StatefulWidget {
  final bool userStatus;
  const LegitimateUser({super.key, required this.userStatus});

  @override
  State<LegitimateUser> createState() => _LegitimateUserState();
}

class _LegitimateUserState extends State<LegitimateUser> {
  int pageToLoad = 0;

  List routes = <Widget>[
    const MainNavigation(child: HomePage()),
    LoginPage(),
  ];

  @override
  void initState() {
    super.initState();
    pageToLoad = widget.userStatus ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return routes.elementAt(pageToLoad);
  }
}
