import 'package:assesment/Screens/products_screen.dart';
import 'package:assesment/Screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/signinprovider.dart';
import '../Widgets/signup_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<LoginProvider>(
          builder: (context, provider, child) => Form(
            key: formKey,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage("images/rr.png"),
                ),
                textFormCustom('email', false, provider.email, Icons.email),
                textFormCustom(
                    'password', true, provider.password, Icons.password),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await provider.checkLogin();
                        provider.email.clear();
                        provider.password.clear();

                        if (provider.user == null) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('invalid data'),
                            showCloseIcon: true,
                          ));
                        } else {
                          print(provider.user);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(provider.user!.email),
                          ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductPage()));
                        }
                      }
                    },
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()));
                    },
                    child: const Text(
                      'Register',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
