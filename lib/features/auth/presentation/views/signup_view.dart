import 'package:flutter/material.dart';
import 'package:splitease/features/auth/presentation/views/login_view.dart';
import 'package:splitease/shared/core/constants/app_string.dart';
import 'package:splitease/shared/ui/widgets/app_text_field.dart';
import 'package:splitease/shared/ui/widgets/social_auth_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = '/signup';

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
            Text('Create Account', style: theme.textTheme.headlineLarge),
            const SizedBox(height: 8),
            Text(
              'Join SplitEase to start managing shared expenses effortlessly.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 48),
            const AppTextField(
              label: AppStrings.usernamePlaceholder,
              hint: 'Choose a username',
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 24),
            const AppTextField(
              label: AppStrings.emailPlaceholder,
              hint: 'Enter your email',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            const AppTextField(
              label: AppStrings.passwordPlaceholder,
              hint: 'Create a password',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
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
            SocialAuthButton.google(
              onPressed: () {},
              label: 'Sign up with Google',
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: theme.textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                    context,
                    LoginView.routeName,
                  ),
                  child: const Text(AppStrings.loginButton),
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
