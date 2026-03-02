import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:splitease/shared/data/services/app_launch_service.dart';

part 'app_launch_provider.g.dart';

@riverpod
AppLaunchService appLaunchService(AppLaunchServiceRef ref) {
  return const AppLaunchService();
}

@riverpod
Future<bool> appLaunchState(AppLaunchStateRef ref) async {
  final service = ref.watch(appLaunchServiceProvider);
  return service.hasSeenOnboarding();
}
