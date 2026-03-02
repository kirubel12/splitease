import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splitease/features/auth/presentation/providers/auth_provider.dart';
import 'package:splitease/features/auth/presentation/views/login_view.dart';
import 'package:splitease/features/home/presentation/views/home_view.dart';
import 'package:splitease/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:splitease/shared/providers/app_launch_provider.dart';

class AuthStartupGateView extends ConsumerWidget {
  const AuthStartupGateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAsync = ref.watch(authControllerProvider);
    final appLaunchAsync = ref.watch(appLaunchStateProvider);

    if (authAsync.isLoading || appLaunchAsync.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final isAuthenticated = authAsync.valueOrNull?.isAuthenticated ?? false;
    final hasSeenOnboarding = appLaunchAsync.valueOrNull ?? false;

    if (isAuthenticated) {
      return const HomeView();
    }

    if (!hasSeenOnboarding) {
      return const OnboardingView();
    }

    return const LoginView();
  }
}
