import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splitease/features/onboarding/presentation/widgets/onboarding_slide.dart';
import 'package:splitease/shared/core/constants/app_string.dart';
import 'package:splitease/shared/providers/theme_provider.dart';

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  static const _pageCount = 3;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool get _isLastPage => _currentPage == _pageCount - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_isLastPage) {
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
    );
  }

  void _goBack() {
    if (_currentPage == 0) {
      return;
    }

    _pageController.previousPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final themeMode = ref.watch(appThemeModeProvider);

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colors.primaryContainer.withAlpha(120),
              theme.scaffoldBackgroundColor,
              colors.secondaryContainer.withAlpha(80),
            ],
            stops: const [0, 0.55, 1],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final isWide = width >= 840;
              final horizontalPadding = width >= 600 ? 32.0 : 20.0;
              final maxContentWidth = isWide ? 780.0 : 560.0;

              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxContentWidth),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        _TopBar(
                          themeMode: themeMode,
                          onToggleTheme: () =>
                              ref.read(appThemeModeProvider.notifier).toggleTheme(),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(isWide ? 28 : 24),
                            child: ColoredBox(
                              color: colors.surface.withAlpha(220),
                              child: PageView(
                                controller: _pageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
                                children: const [
                                  OnboardingSlide(
                                    title: AppStrings.onboardingOneTitle,
                                    body: AppStrings.onboardingOneBody,
                                  ),
                                  OnboardingSlide(
                                    title: AppStrings.onboardingTwoTitle,
                                    body: AppStrings.onboardingTwoBody,
                                  ),
                                  OnboardingSlide(
                                    title: AppStrings.onboardingThreeTitle,
                                    body: AppStrings.onboardingThreeBody,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _BottomControls(
                          currentPage: _currentPage,
                          pageCount: _pageCount,
                          isLastPage: _isLastPage,
                          controller: _pageController,
                          onBack: _goBack,
                          onNext: _goNext,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.themeMode,
    required this.onToggleTheme,
  });

  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: colors.primaryContainer.withAlpha(140),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            'SplitEase',
            style: theme.textTheme.labelLarge?.copyWith(
              color: colors.onPrimaryContainer,
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: colors.onSurface,
          ),
          child: const Text('Skip'),
        ),
        const SizedBox(width: 8),
        IconButton.filledTonal(
          onPressed: onToggleTheme,
          icon: Icon(
            themeMode == ThemeMode.dark
                ? Icons.light_mode_rounded
                : Icons.dark_mode_rounded,
          ),
        ),
      ],
    );
  }
}

class _BottomControls extends StatelessWidget {
  const _BottomControls({
    required this.currentPage,
    required this.pageCount,
    required this.isLastPage,
    required this.controller,
    required this.onBack,
    required this.onNext,
  });

  final int currentPage;
  final int pageCount;
  final bool isLastPage;
  final PageController controller;
  final VoidCallback onBack;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmoothPageIndicator(
          controller: controller,
          count: pageCount,
          effect: WormEffect(
            dotColor: colors.primary.withAlpha(45),
            activeDotColor: colors.primary,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 10,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            if (currentPage > 0) ...[
              Expanded(
                child: OutlinedButton(
                  onPressed: onBack,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colors.onSurface,
                    side: BorderSide(color: colors.outline),
                    backgroundColor: colors.surface,
                    minimumSize: const Size.fromHeight(56),
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  ),
                  child: const Text('Back'),
                ),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                  minimumSize: const Size.fromHeight(56),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                ),
                child: Text(isLastPage ? 'Get started' : 'Continue'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
