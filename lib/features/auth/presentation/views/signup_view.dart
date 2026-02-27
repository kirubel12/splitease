import 'package:flutter/material.dart';
import 'package:splitease/shared/core/constants/app_string.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.signUpButton)),
      body: const Center(
        child: Text(AppStrings.signupComingSoon),
      ),
    );
  }
}
