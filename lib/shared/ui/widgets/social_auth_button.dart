import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String? iconAsset; // For future use if we have local SVGs
  final Widget? icon;

  const SocialAuthButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.iconAsset,
    this.icon,
  });

  /// Factory for Google Sign-In button
  factory SocialAuthButton.google({
    required VoidCallback onPressed,
    String label = 'Continue with Google',
  }) {
    return SocialAuthButton(
      label: label,
      onPressed: onPressed,
      icon: Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/c/c1/Google_%22G%22_logo.svg',
        height: 24,
        width: 24,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.g_mobiledata, size: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 12)],
          Text(label),
        ],
      ),
    );
  }
}
