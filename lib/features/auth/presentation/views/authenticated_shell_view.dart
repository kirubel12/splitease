import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splitease/features/auth/presentation/providers/auth_provider.dart';
import 'package:splitease/features/auth/presentation/views/login_view.dart';
import 'package:splitease/shared/core/constants/app_string.dart';

class AuthenticatedShellView extends ConsumerWidget {
  const AuthenticatedShellView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.authenticatedShellTitle)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.authenticatedShellBody,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await ref.read(authControllerProvider.notifier).logout();
                if (!context.mounted) {
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(builder: (_) => const LoginView()),
                  (route) => false,
                );
              },
              child: const Text(AppStrings.logoutButton),
            ),
          ],
        ),
      ),
    );
  }
}
