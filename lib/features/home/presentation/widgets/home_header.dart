import 'package:flutter/material.dart';
import 'package:splitease/shared/core/constants/app_string.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.homeHeader, style: theme.textTheme.headlineLarge),
        const SizedBox(height: 8),
        Text(
          email?.isNotEmpty == true
              ? 'Signed in as $email'
              : AppStrings.homeWelcomeBody,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
