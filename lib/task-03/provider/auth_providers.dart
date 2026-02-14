import 'package:flutter/material.dart';

class AuthProviders extends ChangeNotifier {
  String email = "";
  String password = "";
  bool _isloading = false;
  bool _islogin = false;
  bool get isloading => _isloading;
  bool get islogin => _islogin;

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }

  String? validateEmail(String? value) {
    if ((value == null) || (value.isEmpty)) {
      return "Enter a valid email";
    }
    if (!value.contains('@')) {
      return "Enter a valid email";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (!emailRegex.hasMatch(value)) {
      return "Enter valid email";
    }

    return null;
  }

  String? validatePasswrod(String? value) {
    if ((value == null) || (value.length < 6)) {
      return "Password must be atleast 6 characters";
    }
    return null;
  }

  Future<void> login() async {
    _isloading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    _isloading = false;
    _islogin = true;
    notifyListeners();
  }

  void logout() {
    _islogin = false;
    notifyListeners();
  }
}
