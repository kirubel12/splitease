import 'package:flutter/material.dart';
import 'package:splitease/shared/core/constants/app_string.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.loginButton)),
      body: const Center(
        child: Text(AppStrings.loginComingSoon),
      ),
    );
  }
}
