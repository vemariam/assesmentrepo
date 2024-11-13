import 'package:flutter/material.dart';

import '../Models/signup_model.dart';
import '../Services/signup_service.dart';

class RegistrationProvider extends ChangeNotifier {
  var name = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  SignUpModel? user;

  Future<void> checkSignUp() async {
    user = await AuthService().signUp(SignUpModel(
        name: name.text,
        email: email.text,
        password: password.text,
        phone: phone.text));
  }
}
