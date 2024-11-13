import 'package:flutter/material.dart';
import '../Models/signup_model.dart';
import '../Services/signup_service.dart';

class LoginProvider extends ChangeNotifier {
  var email = TextEditingController();
  var password = TextEditingController();
  LoginModel? user;

  Future<void> checkLogin() async {
    user = await AuthService()
        .signIn(LoginModel(email: email.text, password: password.text));
  }
}
