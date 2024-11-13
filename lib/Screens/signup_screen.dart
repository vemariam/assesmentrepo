import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/signup_provider.dart';
import '../Widgets/signup_widget.dart';

import 'login_Screen.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<RegistrationProvider>(
          builder: (context, provider, child) => Form(
            key: formKey,
            child: Column(
              children: [
                textFormCustom('name', false, provider.name, Icons.person),
                textFormCustom('phone', false, provider.phone, Icons.phone),
                textFormCustom('email', false, provider.email, Icons.email),
                textFormCustom(
                    'password', true, provider.password, Icons.password),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await provider.checkSignUp();
                        provider.email.clear();
                        provider.password.clear();
                        provider.name.clear();
                        provider.phone.clear();
                        if (provider.user == null) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('invalid data'),
                            showCloseIcon: true,
                          ));
                        } else {
                          print(provider.user);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(provider.user!.name),
                            showCloseIcon: true,
                          ));
                        }
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    )),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text(
                      'Sign In',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
