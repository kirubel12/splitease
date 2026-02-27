import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class OnboardingSlide extends StatelessWidget {
  final String title;
  final String body;

  const OnboardingSlide({super.key, required this.title, required this.body});

  IconData _resolveSlideIcon(String title) {
    final normalized = title.toLowerCase();

    if (normalized.contains('scan')) {
      return Icons.receipt_long_rounded;
    }
    if (normalized.contains('assign') || normalized.contains('ate')) {
      return Icons.group_work_rounded;
    }
    return Icons.check_circle_outline_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final bubbleBase = colors.surface;

    return Stack(
      children: [
        // Subtle background orbs blended into the slide body.
        Positioned(
          top: -100,
          right: -50,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bubbleBase.withAlpha(90),
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          left: -100,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bubbleBase.withAlpha(55),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 520;
              final panelSize = isWide ? 168.0 : 136.0;
              final iconSize = isWide ? 58.0 : 46.0;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 550),
                    child: Center(
                      child: Container(
                        width: panelSize,
                        height: panelSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          color: colors.surface.withAlpha(170),
                          border: Border.all(
                            color: colors.outlineVariant.withAlpha(120),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: colors.primary.withAlpha(28),
                              blurRadius: 34,
                              offset: const Offset(0, 14),
                            ),
                          ],
                        ),
                        child: Icon(
                          _resolveSlideIcon(title),
                          size: iconSize,
                          color: colors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Elegant SlideIn animation for title.
                  SlideInLeft(
                    duration: const Duration(milliseconds: 600),
                    child: Text(
                      title.toUpperCase(),
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: colors.onSurface,
                        letterSpacing: -1.5,
                        height: 1.05,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Gradient divider.
                  FadeIn(
                    duration: const Duration(milliseconds: 800),
                    delay: const Duration(milliseconds: 200),
                    child: Container(
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Subtle FadeIn for body text.
                  FadeIn(
                    duration: const Duration(milliseconds: 800),
                    delay: const Duration(milliseconds: 400),
                    child: Text(
                      body,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: colors.onSurface.withAlpha(150),
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
