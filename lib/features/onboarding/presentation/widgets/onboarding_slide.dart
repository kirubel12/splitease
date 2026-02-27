import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class OnboardingSlide extends StatelessWidget {
  final String title;
  final String body;
  final Widget? illustration;
  final bool isLast;

  const OnboardingSlide({
    super.key,
    required this.title,
    required this.body,
    this.illustration,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          // Illustration Placeholder with animation
          ZoomIn(
            duration: const Duration(milliseconds: 600),
            child:
                illustration ??
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 100,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
          ),
          const Spacer(flex: 2),
          // Title with FadeInUp animation
          FadeInUp(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 200),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Body text with FadeInUp animation
          FadeInUp(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 400),
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
