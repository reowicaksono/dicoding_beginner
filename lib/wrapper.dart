import 'package:dicoding_beginner/utils/app_constants.dart';
import 'package:dicoding_beginner/utils/app_preferences.dart';
import 'package:dicoding_beginner/utils/app_routes.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AppPreferences _pref = AppPreferences();

  @override
  void initState() {
    checkUserLogin();
    super.initState();
  }

  void checkUserLogin() async {
    final bool isLoggedIn = await _pref.getLoginState();
    final String role = await _pref.getRole();
    print(isLoggedIn);
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(
        context,
        DASHBOARD,
      );
    } else {
      Navigator.pushReplacementNamed(context, LOGIN_ROUTE);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
