import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  void setLoginState(bool loginState) async {
    SharedPreferences pref = await _pref;
    pref.setBool('login', loginState);
  }

  Future<bool> getLoginState() async {
    SharedPreferences pref = await _pref;
    return pref.getBool('login') ?? false;
  }

  void setOnboardingState(bool onboardingState) async {
    SharedPreferences pref = await _pref;
    pref.setBool('onboarding', onboardingState);
  }

  Future<bool> getOnboardingState() async {
    SharedPreferences pref = await _pref;
    return pref.getBool('onboarding') ?? false;
  }

  void setToken(String token) async {
    SharedPreferences pref = await _pref;
    pref.setString('token', token);
  }

  Future<String> getToken() async {
    SharedPreferences pref = await _pref;
    return pref.getString('token') ?? '';
  }

  void setRole(String role) async {
    SharedPreferences pref = await _pref;
    pref.setString('role', role);
  }

  Future<String> getRole() async {
    SharedPreferences pref = await _pref;
    return pref.getString('role') ?? '';
  }
}
