import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _email = "";
  String _password = "";
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String get email => _email;

  void setEmail(String value) => _email = value.trim();
  void setPassword(String value) => _password = value.trim();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email required";
    if (!value.contains("@")) return "Invalid email";
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6)
      return "Password must be at least 6 characters";
    return null;
  }

  /// ✅ Simple login (just simulates login)
  Future<String?> login() async {
    if (_email.isEmpty || _password.isEmpty) {
      return "Email or Password cannot be empty";
    }

    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2)); // simulate network delay

    _isLoading = false;
    notifyListeners();

    return null; // success
  }

  /// ✅ Logout
  void logout() {
    _email = "";
    _password = "";
    notifyListeners();
  }
}
