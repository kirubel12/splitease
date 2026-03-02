import 'package:flutter/material.dart';
import 'package:splitease/features/auth/presentation/views/signup_view.dart';
import 'package:splitease/shared/core/constants/app_string.dart';
import 'package:splitease/shared/ui/widgets/app_text_field.dart';
import 'package:splitease/shared/ui/widgets/social_auth_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text('Welcome Back', style: theme.textTheme.headlineLarge),
            const SizedBox(height: 8),
            Text(
              'Log in to continue splitting bills with friends.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 48),
            const AppTextField(
              label: AppStrings.emailPlaceholder,
              hint: 'Enter your email',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            const AppTextField(
              label: AppStrings.passwordPlaceholder,
              hint: 'Enter your password',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: const Text(AppStrings.loginButton),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Divider(color: theme.colorScheme.outlineVariant),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OR',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(color: theme.colorScheme.outlineVariant),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SocialAuthButton.google(onPressed: () {}),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: theme.textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, SignUpView.routeName),
                  child: const Text(AppStrings.signUpButton),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
