import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splitease/features/auth/presentation/providers/auth_provider.dart';
import 'package:splitease/features/auth/presentation/views/login_view.dart';
import 'package:splitease/features/home/presentation/widgets/home_header.dart';
import 'package:splitease/shared/core/constants/app_string.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider).valueOrNull;
    final email = authState?.user?.email;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appTitle)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Text(AppStrings.homeHeader, style: TextStyle(fontSize: 28)),
          ],
        ),
      ),
    );
  }
}
