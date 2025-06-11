import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUsername = 'username';
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static const _keyIsLoggedIn = 'isLoggedIn';

  /// Initialize shared preferences
  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static printFunction() {
    print('Preferences initialized');
  }

  /// Set user credentials and login state
  static Future saveUserCredentials({
    required String username,
    required String email,
    required String password,
  }) async {
    await _preferences.setString(_keyUsername, username);
    await _preferences.setString(_keyEmail, email);
    await _preferences.setString(_keyPassword, password);
    await _preferences.setBool(_keyIsLoggedIn, true);
  }

  /// set isLoging to true
  static Future setLogin(context) async {
    await _preferences.setBool(_keyIsLoggedIn, true);

    print('Login is now set to true');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login is now set to true')));
  }

  /// Get user credentials
  static String? getUsername() => _preferences.getString(_keyUsername);
  static String? getEmail() => _preferences.getString(_keyEmail);
  static String? getPassword() => _preferences.getString(_keyPassword);
  static bool isLoggedIn() => _preferences.getBool(_keyIsLoggedIn) ?? false;

  /// Clear user credentials
  static Future logout() async {
    await _preferences.clear();
  }
}
